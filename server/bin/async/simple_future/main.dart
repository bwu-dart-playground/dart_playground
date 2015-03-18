import 'dart:async' show Future;
import 'package:stack_trace/stack_trace.dart';

main() {
  Chain.capture(() => new Future(() => someFunc()));
}

someFunc() => new Future(() => someOtherFunc());

someOtherFunc() {
  print(new Chain.current().terse);
}

