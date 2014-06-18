import 'dart:mirrors';

const annotation = null;

main() {

  @annotation
  var a = "";

  LibraryMirror lm = currentMirrorSystem().findLibrary(new Symbol(''));
  MethodMirror x = lm.declarations[#main];

  InstanceMirror im = reflect(a);
  var r = im.reflectee;

}