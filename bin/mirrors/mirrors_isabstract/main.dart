library x;

import 'dart:mirrors';

abstract class MyAbstract {
  MyAbstract.named();
  void doSomething();
}

class MyConcrete{
}


void main(List<String> args) {
  print('MyAbstract: ${isAbstract(MyAbstract)}');
  print('MyConcrete: ${isAbstract(MyConcrete)}');
}

bool isAbstract(Type t) {
  ClassMirror cm = reflectClass(t);
  if(cm.declarations.values.firstWhere(
      (MethodMirror mm) => mm.isAbstract == true, orElse: () => null) != null) {
    return true;
  }
  try {
    InstanceMirror i = cm.newInstance(new Symbol(''), []);
    //InstanceMirror i = cm.newInstance(new Symbol('named'), []);
  } catch(e) {
    return (e is AbstractClassInstantiationError);
  }
  return false;
}