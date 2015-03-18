library example;

import 'dart:mirrors';

import 'package:unittest/unittest.dart';
import 'package:unittest/html_config.dart';

class Foo {
  bool _table;

  bool get table => _table;
  bool set table(val) => _table = val;
}

void main() {
  useHtmlConfiguration();
  test('foo mirror', () {
    ClassMirror cm = reflectClass(Foo);
    Symbol s = #table;
    InstanceMirror m = reflect(new Foo());
    m.setField(s, true);
    expect(m.getField(s).reflectee, true);
    m.setField(s, false);
    expect(m.getField(s).reflectee, false);
  });
}
