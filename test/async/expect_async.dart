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

  Future<bool> doSomething() {
//    return new Future.delayed(new Duration(seconds: 5), () {
//      print('done');
//      return true;
//    });
    var c = new Completer();
    c.complete(true);
    return c.future;
  }

  group('group', () {
    test('xx', () {
      return doSomething().then((ok) => expect(ok, equals(true)))
      .catchError((e, s) {
        print(e);
      })
      .then((_) {
        expect(new Future.delayed(new Duration(seconds: 5), () {
        }), completes);
      });
    });

    test('xx1', () {
      var future = doSomething();
      expect(future, completion(equals(true)));
    });
  });
}
