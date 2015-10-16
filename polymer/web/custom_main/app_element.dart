import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  @override
  void attached() {
    super.attached();
    //throw "some error";
    children.forEach((c) => print(c));
  }
}
