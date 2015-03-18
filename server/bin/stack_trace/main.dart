import 'dart:async';
import 'package:stack_trace/stack_trace.dart';

void main() {
  Chain.capture(() {
    scheduleAsync();
  }, onError: (error, stack) {
      print(error);
      print(stack.terse);
    });
}

void scheduleAsync() {
  new Future.delayed(new Duration(seconds: 1))
      .then((_) => runAsync());
}

void runAsync() {
  throw 'oh no!';
}
