library test_element;

import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('test-element')
class PeopleElement extends PolymerElement {

  List<List<String>> rows =
  [
    ['Row1-cell1', 'Row1-cell1', 'Row1-cell3', 'Approved'],
    ['Row2-cell1', 'Approved', 'Row2-cell3', 'Row2-cell4'],
    ['Approved', 'Row3-cell2', 'Row3-cell3', 'Row3-cell4'],
    ['Row4-cell1', 'Row4-cell2', 'Row4-cell3', 'Row4-cell4']
  ];

  PeopleElement.created() : super.created() {
    print('PeopleElement');
  }
}
