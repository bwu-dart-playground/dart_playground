library test;

import "dart:mirrors";

class TestClass {
  doStuff() => print("doStuff was called!");
}

main() {
  MirrorSystem mirrors = currentMirrorSystem();
  LibraryMirror lm = mirrors.libraries.values.firstWhere(
      (LibraryMirror lm) => lm.qualifiedName == new Symbol('test'),
      orElse: () => null);

  ClassMirror cm = lm.declarations[new Symbol('TestClass')];

  InstanceMirror im = cm.newInstance(new Symbol(''), []);
  var tc = im.reflectee;
  tc.doStuff();
}