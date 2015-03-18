import 'package:polymer/polymer.dart';

@CustomTag('polymer-test')
class PolymerTest extends PolymerElement {
  PolymerTest.created() : super.created() {
  }

  void attached() {
    super.attached();
  }
  bool get applyAuthorStyles => true;
}