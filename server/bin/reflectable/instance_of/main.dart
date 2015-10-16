import 'package:reflectable/reflectable.dart';

// Annotate with this class to enable reflection.
class Reflector extends Reflectable {
  const Reflector()
      : super(typeCapability); // Request the capability to invoke methods.
}

const reflector = const Reflector();

@reflector
class SomeClass {}

@reflector
class SomeOtherClass extends SomeClass {}

void someMethod(Type t, dynamic instance) {
  InstanceMirror instanceMirror = reflector.reflect(instance);
  print(instanceMirror.type.isSubclassOf(reflector.reflectType(t)));
}

void main() {
  var s1 = new SomeOtherClass();
  someMethod(SomeClass, s1);
}
