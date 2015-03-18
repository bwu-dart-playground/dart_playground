library x;

//import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class MySelect extends PolymerElement {
  @observable var currentIndex = 1;
  @observable var dropDownValue;

  MySelect.created() : super.created() {
    print('MySelect');
  }

  void changedHandler(Event event) {
    print('changed: ${currentIndex}');
  }

  void clickHandler(Event event) {
    $['asset'].value = "";
  }

  void currentIndexChanged(old) {
    print('currentIndexChange: ${currentIndex} ${currentIndex is int}');
  }

  void dropDownValueChanged(old) {
    print('dropDownValue: ${dropDownValue} ${dropDownValue is int}');
  }

}
