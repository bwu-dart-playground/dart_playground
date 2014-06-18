import 'dart:html';

main () {
  querySelector('#id2').onClick.listen((e) {
    var div1 = querySelector('#id1');
    var div2 = querySelector('#id2');
    div2.style.backgroundImage = div1.getComputedStyle().backgroundImage;
    div1.style.backgroundImage = 'none';
  });
}

