library x;

import 'dart:async';
import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class MySelect extends PolymerElement {
  @observable String message = "";

  MySelect.created() : super.created() {
    print('MySelect');
  }

  void messageChanged(old) {
    var ta = $['ta'];
    ta.scrollTop = ta.scrollHeight;
  }

  void enteredView() {
    super.enteredView();
    new Timer.periodic(new Duration(seconds: 1), (_) => message += 'some text ${new DateTime.now()}\n');
  }
}