import 'dart:async';

void main() {
  print('Let\'s get started');
  artificialWait().then((e) => print(e));
  // and how about printing the return here?
  print('something fast');
}

Future<String> artificialWait  () {
  var completer = new Completer<String>();
  Timer.run(() {
    for (var i = 0; i < 5000000000; i++) {
      // lol
    }
    completer.complete('finally');
  });
  return completer.future;
}
