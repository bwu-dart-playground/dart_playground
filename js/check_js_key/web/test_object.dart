//@Js('console')
library test_object;

import 'package:js/js.dart';

//@Js()
//external void log(String message);


//@Js('testObject')
//class TestObject {
//  external String get firstName;
//  external set firstName(String firstName);
//  external String get lastName;
//  external set lastName(String lastName);
//  external int get age;
//  external set age(int age);
//  external String get eyeColor;
//  external set eyeColor(String eyeColor);
//  external String fullName();
//
////  external factory TestObject();
//}

@JS
@anonymous
class Apple {
  external String get type;
  external set type(String type);
  external String get color;
  external set color(String color);
//  external factory Apple(String type);
}
