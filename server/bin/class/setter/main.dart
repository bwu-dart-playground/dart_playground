import 'dart:async' show Future, Stream;

class SomeClass {
  int _someValue;
  void set someValue(int val) =>
    new Future.delayed(new Duration(milliseconds: 500), () => _someValue = val);

  Future set someValue(int val) =>
    new Future.delayed(new Duration(milliseconds: 500), () => _someValue = val);

  int get someValue => _someValue;
}
