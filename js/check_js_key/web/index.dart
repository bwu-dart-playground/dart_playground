library _template.web;

import 'dart:js' as js;
//import 'dart:async' show Future;
import 'package:js/js.dart';
//import 'test_object.dart';

@JS()
external String testFunction();

@JS()
external String callDartMethod(p);

main() {
  print(testFunction());
  var apple = new js.JsObject(js.context['Apple'], ['Macintosh']);
  print(apple.callMethod('getInfo', []));
  print(new Apple('Macintosh').type);
  print(new Apple('Macintosh').getInfo2());
  print(new Apple('Macintosh').getInfo());

//  new Person('Günter', 'Zöchbauer')
  final p = Person.create(firstName: 'Günter', lastName: 'Zöchbauer');

  print(callDartMethod(p));
  print(p.fullName());
}

@JS()
class Apple {
  external String get type;
  external set type(String type);
  external String get color;
  external set color(String color);
  external String getInfo();
  external String getInfo2();
  external Apple(String type);
}

@JS()
@anonymous
class Person {
  external String get firstName;
  external set firstName(String firstName);

  external String get lastName;
  external set lastName(String lastName);

  external Function get fullName;
  external set fullName(Function function);

  external factory Person({String firstName, String lastName});

  static Person create({String firstName, String lastName}) =>
      new Person(firstName: firstName, lastName: lastName)
        ..fullName = allowInteropCaptureThis(fullNameImpl);

  static String fullNameImpl(self) => '${self.firstName} ${self.lastName}';
}
