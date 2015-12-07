import 'dart:mirrors';

class SomeClass {}

main() {
  String className = 'SomeClass';
  var instance;

  ClassMirror cm = currentMirrorSystem().isolate.rootLibrary.declarations[
      new Symbol(className)];
  if (cm != null) {
    instance = cm.newInstance(new Symbol(''), []).reflectee;
  }
  print(instance);
}
