import 'dart:mirrors';


void main() {
  var mirror = reflectClass(MyClass);
  mirror.declarations.forEach((k, v){
    print(k);
    if(v is VariableMirror){
      TypeMirror tm = v.type;

      print('Type: ${v.type}');
      print('Rt: ${tm.simpleName}');
    }
  });
}


class MyClass{
  var aDynamic;
  int anInt;
}

//prints:
//Symbol("aDynamic")
//TypeMirror on 'dynamic'
//Symbol("anInt")
//ClassMirror on 'int'
//Symbol("MyClass")