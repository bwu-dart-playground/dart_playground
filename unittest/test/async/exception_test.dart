import 'package:test/test.dart';
import 'dart:async';

void main() {
  test( "test2", () {
    expect(throws(), throwsA(new isInstanceOf<FormatException>()));
  });

}

Future throws () async {
  throw new FormatException("hello");
}
