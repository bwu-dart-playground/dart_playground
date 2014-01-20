import 'package:polymer/polymer.dart';
 
@CustomTag('polymer-test')
class PolymerTest extends PolymerElement {
  PolymerTest.created() : super.created() {
  }
 
  void enteredView() {
    super.enteredView();
  }
  bool get applyAuthorStyles => true;
}