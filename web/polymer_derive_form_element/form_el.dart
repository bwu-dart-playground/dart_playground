library x;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('my-login')
class MyLogin extends TableRowElement with Polymer{
  MyLogin.created() : super.created() {
    print('MyLogin');
  }

  enteredView() {
    super.enteredView();
    print('enteredView');
  }
}