import "dart:mirrors";

class OtherClass {
  static getProperties(String className) {
    var classSymbol = new Symbol(className);
    var libs = currentMirrorSystem().libraries;
    var foundLibs = libs.keys.where((lm) =>
        libs[lm].declarations.containsKey(classSymbol) &&
            libs[lm].declarations[classSymbol] is ClassMirror);
    if (foundLibs.length != 1) {
      throw 'None or more than one library containing "${className}" class found';
    }
    ClassMirror cm = libs[foundLibs.first].declarations[classSymbol];
    for (var m
        in cm.declarations.values) print(MirrorSystem.getName(m.simpleName));
  }
}
