import 'dart:mirrors';
import 'do_something.dart';
import 'todo.dart';


void main() {
  currentMirrorSystem().libraries.forEach((uri, lib) {
    //print('lib: ${uri}');
    lib.declarations.forEach((s, decl) {
      //print('decl: ${s}');
      decl.metadata.where((m) => m.reflectee is Todo).forEach((m) {
        var anno = m.reflectee as Todo;
        if(decl is MethodMirror) {
          print('Todo(${anno.who}, ${anno.what})');
          ((decl as MethodMirror).owner as LibraryMirror).invoke(s, []);
        };
      });
    });
  });
}
