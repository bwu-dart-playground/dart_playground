
import 'dart:html' as dom;
import 'package:polymer/polymer.dart';
import 'package:core_elements/core_tooltip.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {  }

  @PublishedProperty(reflect: true) bool isValidationError;

  void attached() {
    super.attached();
    CoreTooltip tt =  new CoreTooltip();
    print(tt);
  }
}
