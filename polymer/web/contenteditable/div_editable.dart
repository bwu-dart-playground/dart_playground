import 'package:polymer/polymer.dart';

import 'dart:html' as dom;
@CustomTag('div-editable')
class DivEditable extends dom.DivElement with Polymer, Observable {

  /// Constructor used to create instance of DivEditable.
  DivEditable.created() : super.created() {
    polymerCreated();
  }
}
