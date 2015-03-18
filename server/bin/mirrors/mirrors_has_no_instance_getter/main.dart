library x;

import 'dart:mirrors';

class TestUser extends Object{
  String name = 'aaa';
  String status = 'bbb';
  String position = 'ccc';
  int age = 20;
}


void main(List<String> args) {

  var mapVal = new TestUser();
  InstanceMirror mirror = reflect(mapVal);
  var imx = reflect(mapVal).type.instanceMembers[#name];
  var x = imx != null && imx.isGetter;

  var hasName = mirror.type.declarations.containsKey(#name);
  var im = mirror.getField(#age);
  //futureValue.then((imValue) => print("Field: age = ${imValue.reflectee}"));
  print(im.reflectee);
}