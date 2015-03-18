library x;

import 'dart:html';
import 'dart:async';
import 'dart:math';

void main() {
  var rnd = new Random();
  var my_tchat;
  TextAreaElement input = document.querySelector('#input');

  input.onKeyPress.listen((key) {
    print(key);
  });

  new Timer.periodic(new Duration(seconds: 1), (_) {
    var l = input.value.length;
    if (l > 0) {
      var pos = rnd.nextInt(l);
      input.setSelectionRange(pos, pos);
    }
  });
}
