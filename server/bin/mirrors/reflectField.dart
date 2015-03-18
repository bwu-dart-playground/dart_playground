library operator_lib;

import 'dart:mirrors';

void main(List<String> args) {
  var x = new X();
  var f = new Symbol('firstName');
  var r = reflect(x);
  print(r.getField(f).reflectee);
  r.setField(f, "John");
  print(r.getField(f).reflectee);
  
}

class X {
  String firstName = 'Mike';
}