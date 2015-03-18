import 'dart:html';
import 'dart:async';

void main() {
  var m = document.querySelector('#menudemo');
  m.onContextMenu.listen((MouseEvent e) {
    print(e);
    new Future(() {
      List checked = document.querySelectorAll(":checked");
      checked.forEach((var elem) {
        print("${elem.id}");
      });
    });
  });
}
