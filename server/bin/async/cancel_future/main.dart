library cancel_future;

import 'dart:async' show Future, Timer;
import 'dart:math' show Random;

typedef void TaskFunction(Task task);

// Container for a task
class Task {
  // an assigned task id
  final id;
  // data to process
  int data;
  // Indicate to the task function, that it should stop processing
  bool isCanceled = false;
  // The task function must set this flat to true when all work is done.
  bool isFinished = false;
  // The task function which processed the data and sets the result.
  TaskFunction fn;
  // The result set by the task function when it finished processing.
  int result;

  Task(this.id, this.data, this.fn);

  // Start processing the task.
  void execute() => fn(this);
}

final rnd = new Random();

void main(List<String> args) {

  // create tasks
  final tasks = new List<Task>.from(generate());

  // start all tasks
  tasks.forEach((t) => t.execute());

  // after random delay cancel all unfinished tasks
  new Future.delayed(new Duration(seconds: rnd.nextInt(10)), () {
    tasks.forEach((t) {
      if (!t.isFinished) {
        t.isCanceled = true;
      }
    });
  }).then((_) {
    // check results
    int done = 0;
    int canceled = 0;
    tasks.forEach((t) {
      print(
          'Task id: ${t.id}; isCanceled: ${t.isCanceled}; isFinished: ${t.isFinished}; data: ${t.data}; result: ${t.result}');
      if (t.isFinished) {
        done++;
      }
      if (t.isCanceled) {
        canceled++;
      }
    });

    print('Canceled: $canceled.');
    print('Done: $done.');
  });
}

// geneator for job 100 jobs
Iterable<Task> generate() sync* {
  int i = 0;

  while (i++ < 100) {
    yield new Task(i, rnd.nextInt(100), calc);
  }
}

// job function
void calc(Task t) {
  // do a bit of work every 100ms to simulate longer processing
  new Timer.periodic(new Duration(milliseconds: 100), (timer) {
    var result = 0;
    // check if jost was canceled and stop processing in case it was.
    if (t.isCanceled) {
      timer.cancel();
      return;
    }
    // while not finished do a chunk of work
    if (result < t.data) {
      result++;
    } else {
      // finished - clean up and store result
      t.isFinished = true;
      t.result = result;
      timer.cancel();
    }
  });
}
