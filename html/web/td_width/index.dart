import 'dart:html';

void main() {
  printWidth('id1');
  printWidth('id2');
  printWidth('id3');
}

printWidth(String id) {
  print('${id}:');
  CssStyleDeclaration elem = querySelector('#${id}').getComputedStyle();

  print('width: ${elem.width}');
  print('borderLeftWidth: ${elem.borderLeftWidth}');
  print('borderRightWidth: ${elem.borderRightWidth}');
  print('paddingLeft: ${elem.paddingLeft}');
  print('paddingRight: ${elem.paddingRight}');
}
