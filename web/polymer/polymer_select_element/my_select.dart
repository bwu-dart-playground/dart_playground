library x;

//import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class MySelect extends PolymerElement {
  @observable int currentIndex = 1;
  @observable int value = 1;

  MySelect.created() : super.created() {
    print('MySelect');
  }

  void changedHandler(event, details, Element target) {
    print('changed: ${currentIndex}');
  }

  void currentIndexChanged(old) {
    print('currentIndexChange: ${currentIndex}');
  }
}