library x;

import 'dart:html';
import 'dart:convert';
import 'package:polymer/polymer.dart';

//void main(List<String> args) {
//  var b;
//  var i = b ? 0 : 1;
//}

@CustomTag('my-tr')
class MyTr extends TableRowElement with Polymer{
  @observable List<String> values = toObservable(['1', '2', '3', '4']);

  MyTr.created() : super.created() {
    print('MyTr');
    List<int> bytesForIso_8859_2 = new Latin1Encoder().convert("Günter Zöchbauer");
    var bytesForUTF8 = LATIN1.fuse(UTF8).encode(bytesForIso_8859_2);
  }

  enteredView() {
    super.enteredView();
    print('enteredView');
  }
}