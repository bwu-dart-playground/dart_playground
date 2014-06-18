import 'dart:mirrors' as mirr;

class A {
  String s;
  A(this.s);
  @override
  String toString() => s;
}

void main() {
  Type type = A;
  var str = "Hello Dart";
  mirr.ClassMirror cm = mirr.reflectType(type);
  var s = cm.newInstance(new Symbol(''), [str]).reflectee;
  print(s);
}