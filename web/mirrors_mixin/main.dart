library x;

import 'dart:mirrors';

class MyMixin {
  String s;
  //mixinMethod() {}
}

class MyInterface {

}

class AClass extends Object with MyMixin {}
class BClass extends Object              {}
class CClass implements MyInterface {

}

bool classIncludesMixin(o, String mixinName) {
  var c = reflect(o).type;
  print(c.mixin.simpleName);
  while (c != null) {
    if (c.mixin.simpleName == new Symbol(mixinName)) return true;
    c = c.superclass;
  }
  return false;
}

void main(List<String> args) {
  print(classIncludesMixin(new AClass(), 'MyMixin')); // => true
  print(classIncludesMixin(new BClass(), 'MyMixin')); // => false
  print(classIncludesMixin(new CClass(), 'MyMixin')); // => false
  print(classIncludesMixin(new MyMixin(), 'MyMixin')); // => false
}