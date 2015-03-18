import 'package:polymer/polymer.dart';

import 'dart:html';

@CustomTag('my-li')
class MyLi extends LIElement with Polymer, Observable {

  factory MyLi() => new Element.tag('li', 'my-li');

  MyLi.created() : super.created() {
    polymerCreated();
  }
}
