import 'package:observe/observe.dart';
import 'dart:mirrors';

void main() {
  var a = new ObservableMap();
  var b = {};

  print(a as Map);
  print(b as Map);
  print(a as ObservableMap);
  try {
    print(b as ObservableMap);

  } catch (e) {}
  var aa = reflect(new ObservableMap()).type;
  var bb = reflectType(ObservableMap);
  var cc = reflect(new Map()).type;
  var dd = reflectType(Map);
  print(aa.isAssignableTo(bb));
  print(aa.isSubclassOf(bb));
  print(aa.isSubtypeOf(bb));
  print(bb.isAssignableTo(aa));
  print(bb.isSubclassOf(aa));
  print(bb.isSubtypeOf(aa));

  var AA = reflectType(a.runtimeType);
  print(AA.isAssignableTo(reflectType(Map)));
  print(reflectType(Map).isAssignableTo(AA));

  print(aa.isSubclassOf(reflectType(Map)));
  aa.superinterfaces.forEach((e) => print(e.simpleName));
  aa.declarations.forEach((k,v) => print(k));
  print('mixin: ${aa.mixin}');
  print('originalDeclaration: ${aa.originalDeclaration}');
  aa.superinterfaces.forEach((e) => print('superinterface: $e'));
  print('superclass: ${aa.superclass}');
  print('runtimeType: ${aa}');

}
