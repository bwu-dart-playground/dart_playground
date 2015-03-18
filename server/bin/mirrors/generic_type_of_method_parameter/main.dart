import 'dart:mirrors';

class A{
  void eventHandlerInt(List<int> x){}
  void eventHandlerBool(List<bool> x){}
}

void testMirrors(aFunction){
  ClosureMirror mir = reflect(aFunction);
  List<TypeMirror> param = mir.function.parameters.first.type.typeArguments;
  //How to get the Type T of List<T> of the first param?
  param.forEach((e) => print(e.simpleName));
}

void main() {
  var a = new A();
  testMirrors(a.eventHandlerInt);
  testMirrors(a.eventHandlerBool);
}