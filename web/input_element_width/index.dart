import 'dart:html';

void main() {
  InputElement input = (querySelector('#input') as InputElement);
  print('input: ${input.width}');
}