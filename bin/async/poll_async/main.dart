import 'dart:async';

void main(List<String> args) {

  new Timer.periodic(new Duration(microseconds: 100), (t) {
    if(isDone) {
      t.cancel();
      someCallback();
    }
  });

  new Future.delayed(new Duration(seconds: 10), () => isDone = true);
}

bool isDone = false;

void someCallback() {
  print('isDone: $isDone');
}

