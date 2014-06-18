import 'dart:mirrors';

class Test {
  int member;
}

void main(args) {
  Test test = new Test();
  InstanceMirror im = reflect(test);
  print(im.type.instanceMembers[#member].isGetter); // true
  print(im.type.instanceMembers[#member].isSetter); // true
  print(im.type.instanceMembers[new Symbol('member=')].isSetter); // true
  print(im.type.instanceMembers[#member=].isSetter); // true
  var x = im.type.instanceMembers;
}