import 'dart:mirrors';

import 'some_library.dart';

void main(args) {
  //http://stackoverflow.com/questions/19166146
  MirrorSystem mirrorSystem = currentMirrorSystem();
  LibraryMirror libraryMirror = mirrorSystem.findLibrary(new Symbol('some_library.sublib'));
  ClassMirror classMirror = libraryMirror.declarations[new Symbol('MyClass')];
  InstanceMirror testClassInstanceMirror = classMirror.newInstance(new Symbol(''), []);
  testClassInstanceMirror.invoke(new Symbol('hello'), []);

}