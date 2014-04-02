library test_element;

import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('test-element')
class PeopleElement extends PolymerElement {

  @observable bool show = true;

  void hide() {
    show = false;
  }
  PeopleElement.created() : super.created() {
    print('PeopleElement');

  }

}

