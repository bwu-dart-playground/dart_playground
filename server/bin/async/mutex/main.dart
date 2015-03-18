import 'dart:async' as async;
import 'dart:collection' as coll;
import 'dart:math' as math;

void main() {
  int j = 0;
  int delay = 0;
  for(int i = 0; i < 100; i++) {
    new async.Future.delayed(
        new Duration(milliseconds: delay += rnd.nextInt(150)),
        () => receiveData({'${j++}': j}, j)
    ).catchError((e) => print('Error: $e'));
  }
}

//List carlist = [];

WorkQueue workQueue = new WorkQueue(timeout: new Duration(milliseconds: 270));
math.Random rnd = new math.Random();

// had to made this async to make the timeout functionality work
// otherwise Dart would have evaluated the timeouts only after all other
// code has already been finished
async.Future receiveData(Map data, int id) {

  // ensure that the code passed to add isn't entered by another async thread
  // while it is already executed
  // id is just for debugging purposes
  return workQueue.add(id, () {

    async.Completer completer = new async.Completer();
    print('$id start');
//    for (var i = 0; i < carlist.length;) {
//      carlist.add(data);
//      if (data[carlist[i]['name']]['color'] == carlist[i]['color']) {
//        carlist.removeAt(i);
//        onDeleteCar(data); // Update the UI.
//      }
//    }

    // dummy task to burn time
    new async.Future.delayed(new Duration(milliseconds: rnd.nextInt(100)), () {
      var val = rnd.nextDouble();
      // add some fun - check if code that throws is handled correctly
      if(val > 0.9) {
        completer.completeError('artifical error ${id}');
        print('$id end with error');
      } else {
        completer.complete();
        print('$id end');
      }
    });

    return completer.future;
  });
  // Need a release lock here
}

// just holds a completer and a closure
class Task {
  // complete after f was executed
  async.Completer completer = new async.Completer();
  // this code should only be entered by one thread at a time
  Function f;
  // only for debugging purposes
  int id;
  // ignore timeout if f has already been invoked
  bool isInvoked = false;

  Task(this.id, this.f, Duration timeout){
    if(timeout != null) {
      completer.future.timeout(timeout, onTimeout: () {
        if(!completer.isCompleted && !isInvoked) {
          completer.completeError('${id} timed out');
        }
      })
      // future.timeout creates a new Future which also throws when
      // the completer is completed with completeError
      // not handling this error ends the app with unhandled exception
      .catchError((_) {});
    }
  }
}

class WorkQueue {
  // enque all calls
  coll.Queue q = new coll.Queue();
  // currently executing?
  bool isExecuting = false;

  // throw when the execution is delayed longer than the provide timeout
  Duration timeout;

  WorkQueue({this.timeout});

  // enqueue a new execution
  async.Future add(int id, Function f) {
    print('add $id - queue length: ${q.length}');
    var t = new Task(id, f, timeout);
    q.add(t);
    // ensure that the queue is processed
    new async.Future(release);
    return t.completer.future;
  }

  // execute next waiting thread if any
  void release() {
    // do nothing if closure is currently being executed or queue is empty
    if(!isExecuting && !q.isEmpty) {
      isExecuting = true;
      Task t = q.removeFirst();
      // check if t hasn't alredy timed out
      if(!t.completer.isCompleted) {
        // ignore timeout because we are already being invoked
        t.isInvoked = true;
        // invoke the closure
        new async.Future(t.f)
        // handle errors in closure
        .catchError((e) {
          t.completer.completeError(e);
        })
        // process next Task in queue
        .then((_) {
          isExecuting = false;
          new async.Future(release);
          if(!t.completer.isCompleted) {
            t.completer.complete();
          }
        });
      }
    }
  }
}

