import "dart:mirrors";

void main1() {
  var objectMirror = reflectType(Object);
  var result1 = objectMirror.isSubtypeOf(reflectType(bool));
  var result2 = Object is bool;
  var result3 = objectMirror.isAssignableTo(reflectType(bool));
  print(reflectType(bool).isAssignableTo(objectMirror)); //ok
  print("Object isSubtypeOf    bool: $result1"); // false ok
  print("Object is                 : $result2"); // false ok
  print("Object isAssignableTo     : $result3"); // true  ok
}

void main() {
  var dynamicMirror = reflectType(dynamic);
  var result1 = dynamicMirror.isSubtypeOf(reflectType(bool));
  var result2 = dynamic is bool;
  var result3 = dynamicMirror.isAssignableTo(reflectType(bool));
  print("dynamic isSubtypeOf    bool: $result1"); // true
  print("dynamic is                 : $result2"); // false
  print("dynamic isAssignableTo     : $result3"); // true
}

class A {}
void main3(args) {
  var x = reflectType(dynamic);
  print(x.originalDeclaration.simpleName);
  print(x.reflectedType);
  print(x.simpleName);

  var y = reflectType(A);

}