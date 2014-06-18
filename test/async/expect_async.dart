library x;

import 'dart:async';
import 'package:unittest/unittest.dart';

class SubjectUnderTest {
  int i = 0;

  doSomething(x, y) {
    i++;
    print('$x, $y');
  }
}

void main(List<String> args) {

  test('async test, check a function with 2 parameters', () {
    var sut = new SubjectUnderTest();
    var done = expectAsync(() {});

    Timer.run(() {
      sut.doSomething(1, 2);
      expect(sut.i, greaterThan(0));
      done();
    });

    Timer.run(() => expectAsync(() {
      sut.doSomething(3, 4);
      expect(sut.i, greaterThan(0));
    }));
  });
}
