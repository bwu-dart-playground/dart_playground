import 'dart:mirrors';


typedef MyFunc(int a, String b);

main() {
  MethodMirror mm = reflectClass(TestClass).declarations[#testFunc1];
  FunctionTypeMirror tdm =(reflectType(MyFunc) as TypedefMirror).referent;
  print(isOfTypeDef(mm, tdm));

  mm = reflectClass(TestClass).declarations[#testFunc2];
  print(isOfTypeDef(mm, tdm));

  mm = reflectClass(TestClass).declarations[#testFunc3];
  print(isOfTypeDef(mm, tdm));
}


class TestClass {
  void testFunc1(int c, String d) {
    print('$c, $d');
  }

  void testFunc2(var c, var d) {
    print('$c, $d');
  }

  void testFunc3(int e, int f) {
    print('$e, $f');
  }

}

bool isOfTypeDef(MethodMirror mm, FunctionTypeMirror tdm) {

  if((mm.returnType.isAssignableTo(tdm.returnType)) && (mm.parameters.length == tdm.parameters.length)) {
    for(int i = 0; i < mm.parameters.length; i++) {
      if(!mm.parameters[i].type.isAssignableTo(tdm.parameters[i].type)) {
        return false;
      }
    };
  }
  return true;
}