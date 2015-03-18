library x;

import 'dart:html';
import 'dart:async';
import 'dart:math';

void main() {
  final div = querySelector('#div');
  div.onMouseUp.listen(clickHandler);
}

void clickHandler(MouseEvent e) {
  print(window.getSelection().getRangeAt(0).cloneContents().innerHtml);
  print(window.getSelection().getRangeAt(0).cloneContents().text);
}
