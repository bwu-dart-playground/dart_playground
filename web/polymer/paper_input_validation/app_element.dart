import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_input.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {
  AppElement.created() : super.created() {}

  void inputHandler(Event e) {
    var inp = ($['custom'] as CoreInput);
    if(inp.inputValue.length < 5) {
      inp.jsElement.callMethod('setCustomValidity', ["Give me more!"]);
    } else {
      inp.jsElement.callMethod('setCustomValidity', [""]);
    }
  }
}
