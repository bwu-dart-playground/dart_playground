import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:paper_elements/paper_input.dart';



@CustomTag( 'paper-input-snippet' )
class PaperInputSnippet extends PolymerElement {

  PaperInputSnippet.created() : super.created() {
    print('PaperInputSnippet');
  }

  void consumeKey(KeyboardEvent e) {
    if(e.keyCode < '0'.codeUnits[0] || e.keyCode > '9'.codeUnits[0]) {
      print(new String.fromCharCode(e.keyCode));
      print('consumeKey');
      e.preventDefault();
      //e.stopImmediatePropagation();
    }
  }

  void publishInstance(MouseEvent e) {
    print('publishInstance');
  }

  void errorMsg(e) {
    print('errorMessage');
  }

  int asInteger(val) {
    if(val is int) {
      return val;
    }
    if(val == null || val is! String) {
      return null;
    }

    return int.parse(val, onError: (s) => 0);
  }

  String frequency = '';

  String digits_regex = r'^[\d]*$';

}