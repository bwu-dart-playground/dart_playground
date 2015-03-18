

import 'dart:mirrors';

class ClassWithPrivateField {

  String _privateField;
}

void main() {

  ClassMirror classM = reflectClass(ClassWithPrivateField);
  Symbol privateFieldSymbol;
  Symbol constructorSymbol;
  for (DeclarationMirror declaration in classM.declarations.values) {
    if (declaration is VariableMirror) {
      privateFieldSymbol = declaration.simpleName;
    } else if (declaration is MethodMirror && declaration.isConstructor) {
      constructorSymbol = declaration.constructorName;
    }
  }
  InstanceMirror instance = classM.newInstance(constructorSymbol, []);
  //var s = new Symbol('_privateField');
  var s = MirrorSystem.getSymbol('_privateField', instance.type.owner);
  //var s = instance.type.declarations[];

  for (var i=0; i<1000; ++i) {

    instance.setField(s, 'test');
    print('Iteration ${instance.getField(s)}');
  }
}