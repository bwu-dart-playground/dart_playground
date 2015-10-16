import 'dart:html';

void main() {
  var inputs = querySelectorAll("input");
  print(inputs[1] is CheckboxInputElement);
}

