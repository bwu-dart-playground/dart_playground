library x;

import 'dart:async';
import 'package:unittest/unittest.dart';

void main(List<String> args) {
  group("some group", () {
    Timer timeout;
    setUp(() {
      timeout = new Timer(new Duration(seconds: 1), () => fail("timed out"));
    });

    tearDown(() {
        timeout.cancel();
    });
    test("some very slow test", () {
      var callback = expectAsync0((){});
      new Timer(new Duration(milliseconds: 1500), () {
        expect(true, equals(true));
        callback();
      });
    });

    test("another very slow test", () {
      var callback = expectAsync0((){});
      new Timer(new Duration(milliseconds: 1500), () {
        expect(true, equals(true));
        callback();
      });
    });


    test("a fast test", () {
      var callback = expectAsync0((){});
      new Timer(new Duration(milliseconds: 500), () {
        expect(true, equals(true));
        callback();
      });
    });

  });
}