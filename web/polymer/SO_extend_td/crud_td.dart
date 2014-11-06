import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('crud-td')
class CrudTdElement extends TableCellElement with Polymer, Observable {
//class CrudTdElement extends PolymerElement {

  CrudTdElement.created() : super.created() {
    polymerCreated();
  }
}
