library x;

import 'dart:html';

void main() {
  document.body.append(new MyElement.created());
}

class MyElement extends DivElement {
  MyElement.created() : super.created() {
    print('hallo');
  }
}