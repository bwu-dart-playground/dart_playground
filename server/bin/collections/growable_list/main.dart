import 'dart:mirrors';

void main(List<String> args) {
//  List l = new List.from([0,1,2], growable: true);
//  List l2 = new List.from([0,1,2], growable: false);
//
//  print(l.runtimeType);
//  print(l2.runtimeType);
//  Symbol s;
//
//  print(#bla);

  var s = #somename;
  var sName = s.toString();
  print(s);
  print(sName.substring('Symbol("'.length, sName.length - 2));

  print(MirrorSystem.getName(s));
  print(MirrorSystem.getName(reflect(new List.from([0,1,2], growable: true)).type.simpleName) == ('_GrowableList'));

  print(reflect(new List.from([0,1,2], growable: true)).type.simpleName == #_GrowableList);
  print(reflect(new List.from([0,1,2], growable: true)).type.simpleName);
  print(#_GrowableList);
  print(MirrorSystem.getName(reflect(new List.from([0,1,2], growable: true)).type.simpleName));

  print(#_GrowableList == #_GrowableList);
//  var lm2 = reflect(l2);
//
//  var cm = lm.type.simpleName;
//  var cm2 = lm2.type.simpleName;
//
//  print(lm.type.qualifiedName);
//
//
//  print(lm);
}

