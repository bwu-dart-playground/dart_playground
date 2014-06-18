import 'dart:mirrors';
import 'package:observe/observe.dart';

class A {

}

class B extends A implements D {

}

class C extends A {

}

class D {

}

void main(args) {
  var a = 1.1;
  var b = 1;
  var x = reflect(b);
//  print(x.type.isSubtypeOf(reflect(1).type));
//  print(x.type.isAssignableTo(reflectType(num)));
//  print(x.type.isAssignableTo(reflectType(double)));
//
//  var myb = new B();
//
//  print(reflect(myb).type.isSubtypeOf(reflectType(A)));
//  print(reflect(myb).type.isAssignableTo(reflectType(A)));
//  print(reflect(myb).type.isAssignableTo(reflectType(C)));
//
//  print(reflect(myb).type.isSubtypeOf(reflectType(D)));
//  print(reflect(myb).type.isAssignableTo(reflectType(D)));
//
//  var o = new ObservableMap();
//  Map p;
//  p = o;
//
//  print(reflect(o).type.isSubtypeOf(reflectType(Map)));
//  print(reflect(o).type.isAssignableTo(reflectType(Map)));


//  print(reflectType(Map).isSubtypeOf(reflect({}).type));
//  print(reflect({}).type.isAssignableTo(reflectType(Map)));
//  print(reflectType(Map).isSubtypeOf(reflectType(Map)));
//  print(reflect({}).type.isAssignableTo(reflect({}).type));
//
//  print({} is Map);
//
//  var m1 = reflectType(Map);
//  var m2 = reflect({}).type;



}