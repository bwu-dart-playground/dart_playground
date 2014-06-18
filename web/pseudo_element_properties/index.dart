library x;

import 'dart:html' as dom;

void main () {
  dom.window.onResize.listen((e) {
    var gcs = dom.document.body.getComputedStyle('::after');
    print(gcs);
    print(gcs.content);
  });
}


