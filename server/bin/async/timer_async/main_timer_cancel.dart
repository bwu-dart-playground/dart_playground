import 'dart:async';

void main() {
  var timer = new Timer(new Duration(seconds: 1), () => print('done'));
  timer.cancel();
}
