/*if( playground == 'core_elements' ) <!-- copyright notice core-elements -->*/

library playground.my_element;

import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('my-element')
class MyElement extends PolymerElement {
  MyElement.created() : super.created();

  @override
  void attached() {
    super.attached();
  }

  var myValues = [1.0, 2.01, 3.012, 4.0123, 5.01234, 6.012345, 7.0123456, 8.00, 9.111, 0.22331];

  bool myFilter(num val, int precision) {
    return val.toStringAsFixed(precision);
  }
}
