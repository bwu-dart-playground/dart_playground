library test_element;

import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('test-element')
class PeopleElement extends PolymerElement {

  List<List<String>> rows =
  [
    ['Row1-cell1', 'Row1-cell1', 'Row1-cell3', 'Approved', '1'],
    ['Row2-cell1', 'Approved', 'Row2-cell3', 'Row2-cell4', '2'],
    ['Approved', 'Row3-cell2', 'Row3-cell3', 'Row3-cell4', '3'],
    ['Row4-cell1', 'Row4-cell2', 'Row4-cell3', 'Row4-cell4', '4']
  ];

  PeopleElement.created() : super.created() {
    print('PeopleElement');
  }

  @observable int filter;

  filterChanged(old) {
    print(filter);
  }
  //http://stackoverflow.com/questions/21379167
  List filterRow(List l, [a]) {
    if(filter == null) {
      return l;
    } else {
      return l.where((r) => int.parse(r[r.length - 1]) > filter).toList();
    }
  }
}
