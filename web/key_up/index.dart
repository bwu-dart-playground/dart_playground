import 'dart:html';
import 'dart:convert';

void main() {
  InputElement input = (querySelector('#input') as InputElement);
  ParagraphElement p_down = querySelector("#p_down");
  ParagraphElement p_up = querySelector("#p_up");
  String pContent = '';

  input.onKeyUp.listen((e) {
    p_up.text = input.value;
  });

  input.onKeyDown.listen((e) {
    print('charCode: ${e.charCode}; detail: ${e.detail} ${e.keyCode}: ${UTF8.decode([e.detail])}');
    p_down.text = input.value + UTF8.decode([e.keyCode]);
  });

  NodeValidator nodeValidator = new NodeValidatorBuilder()
      ..allowHtml5();
      //..allowTextElements();
      new Element.html("", validator: nodeValidator);
}