import 'dart:mirrors';

class Foo {
 int baz;
}

void main() {
  var name = "baz";
  var typeMirror = reflectClass(Foo);
  //typeMirror.instanceMembers
  typeMirror.typeVariables.forEach((f) => print(f));
//  for(var member in typeMirror.instanceMembers.values) {
//    print(MirrorSystem.getName(member.simpleName));
//    if(MirrorSystem.getName(member.simpleName) == name) {
//      if(member is MethodMirror) {
//        print("================================");
//        print("Info about METHOD $name");
//        print("isSetter: ${member.isSetter}");
//        print("isGetter: ${member.isGetter}");
//        print("isVariable: false, because it is a method");
//        //print(typeMirror.getField(new Symbol(name)) != null);
//        print("================================");
//      }
//    }
//  }
}