library x;

import 'dart:async';

void main(List<String> args) {
  scheduleMicrotask(() {
    if (true != false) {
      print('bla');
    }
  });

  runZoned(() {
    new Timer(Duration.ZERO, () {
      if (true != false) {
        print('bla');
      }
    });
  });
}
