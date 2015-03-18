import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  factory AppElement() {
    final x =  new Element.tag('app-element');
    return x;
  }

  AppElement.created() : super.created();

  @published List<String> years;
}
