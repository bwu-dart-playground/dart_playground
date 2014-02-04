library x;

import 'dart:async';

Future<int> timeconsumingFunctionReturningFuture(int i) {
  var completer = new Completer();
  //new Future.delayed(Duration.ZERO, computation).

  if (i==0) {
    completer.completeError(88);
    return completer.future;
  } else {
    int rc;
    // Line9: rc = timeconsuming algorithm, to calculate rc
    completer.complete(rc);
    //Timer.run(callback)
    return completer.future;
  }
}

void Main(List<String> args) {

}