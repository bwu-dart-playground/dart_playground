import "dart:async";

StreamController jobsController = new StreamController.broadcast();
Stream jobs = jobsController.stream;

class Job {
  void start(Stream stream) {
    stream.forEach((e) {
      print(e);
    });
  }
}

main() {
  new List.generate(5, (i) => new Job()..start(jobs));
  for(int i = 0; i < 10; i++) {
    jobsController.add(i);
  }
  //List squares = new List.generate(30, (i) => i);
  //throttledForEach(squares, f, 5);
}
