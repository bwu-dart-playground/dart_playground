import 'dart:async';
import 'package:unittest/unittest.dart';

main() {
  test('foo', () {
    var completer = new Completer();
    new Future.delayed(new Duration(seconds: 1), () {
      expect(false, isTrue);
      completer.complete();
    }).catchError((e) => completer.completeError(e));
    return completer.future;
  });
}