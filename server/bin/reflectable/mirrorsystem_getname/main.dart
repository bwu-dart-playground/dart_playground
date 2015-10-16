library some_lib;

//import 'dart:mirrors' as mirr;
import 'package:reflectable/reflectable.dart';

class Reflector extends Reflectable {
  const Reflector() : super(typeCapability);
}

const Reflector reflector = const Reflector();

main() {
//  print(mirr.MirrorSystem.getName(#SomeClass));
  reflector.libraries.values.forEach((LibraryMirror lm) {
    if (lm.declarations.containsKey('SomeClass')) {
      print(lm.declarations['SomeClass']);
    }
  });
}

@reflector
class SomeClass {}
