library x;

import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class MySelect extends PolymerElement {
  @observable String text = "bla";

  MySelect.created() : super.created() {
    print('MySelect');
  }

  void textChanged(old) {
    print('currentIndexChange: ${text}');
  }
}