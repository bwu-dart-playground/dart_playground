import "dart:mirrors";

class MyNestedClass {
  String name;
}
class MyClass {
  int i, j;
  int _k;
  MyNestedClass myNestedClass;
  int sum() => i + j;

  MyClass(this.i, this.j);
}

void main() {
  MyClass myClass = new MyClass(3, 5)
    ..myNestedClass = (new MyNestedClass()..name = "luis");
  print(myClass.toString());
  InstanceMirror im = reflect(myClass);


  ClassMirror cm = im.type;
  Map<Symbol, MethodMirror> instanceMembers = cm.instanceMembers;

  cm.declarations.forEach((name, DeclarationMirror declaration) {
    VariableMirror field;
    if(declaration is VariableMirror) field = declaration;

    MethodMirror method;
    if(declaration is MethodMirror) method = declaration;

    if(field != null) {
      print('field: ${field.simpleName}');
    } else if(method != null && !method.isConstructor){
      print('method: ${method.simpleName}');
    }
  });
}