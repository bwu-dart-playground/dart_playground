import 'dart:html';

main () {
  querySelectorAll('input[name=rate]').onClick.listen(clickHandler);
}

void clickHandler(MouseEvent e) {
  print('target: ${(e.target as InputElement).value}');
  print('checked: ${(querySelector('input[name=rate]:checked') as InputElement).value}');
}

