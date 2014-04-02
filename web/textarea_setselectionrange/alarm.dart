library x;

import 'dart:html';
import 'dart:async';

void main() {
  var my_tchat;
  TextAreaElement input = document.querySelector('#ta');

  input.onKeyPress.listen((key) {
    print(key);
  });

  new Timer.periodic(new Duration(seconds: 10), (_) {
    input.setSelectionRange(10, 30);
  });
}
