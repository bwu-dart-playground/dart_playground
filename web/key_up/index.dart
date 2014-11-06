import 'dart:html';
import 'dart:convert';

void main() {
  InputElement input = (querySelector('#input') as InputElement);
  ParagraphElement p_down = querySelector("#p_down");
  ParagraphElement p_up = querySelector("#p_up");
  ParagraphElement aContainer = querySelector("#acontainer");
  String pContent = '';

  input.onKeyUp.listen((e) {
    p_up.text = input.value;
  });

  NodeValidator nodeValidator = new NodeValidatorBuilder()
  //    ..allowHtml5();
//      ..allowCustomElement('a', attributes: ['href']);
        ..allowNavigation(new MiamiHeraldUrlPolicy());

      //..allowTextElements();
      //new Element.html("", validator: nodeValidator);

  input.onKeyDown.listen((e) {
    print('charCode: ${e.charCode}; detail: ${e.detail} ${e.keyCode}: ${UTF8.decode([e.detail])}');
    p_down.text = input.value + UTF8.decode([e.keyCode]);
    aContainer.setInnerHtml('<a href="http://miamiherald.typepad.com/the-starting-gate/2014/09/news-.html">bla</a>', validator: nodeValidator);
  });
}

class MiamiHeraldUrlPolicy implements UriPolicy {
  MiamiHeraldUrlPolicy();

  RegExp regex = new RegExp(r'(?:http://|https://|//)?miamiherald.typepad.com/.*');

  bool allowsUri(String uri) {
    return regex.hasMatch(uri);
  }
}
