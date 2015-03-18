import 'dart:html';

class CustomElement extends HtmlElement {
factory CustomElement() => new Element.tag('x-custom');

     CustomElement.created() : super.created() {
     print('CustomElement created!');
   }
}

void main() {
   document.registerElement('x-custom', CustomElement);
   var elem = new Element.tag('x-element');
   elem.appendText('x-element');
   document.body.append(elem);
   elem.onClick.listen((e) {
     print('clicked');
   });
}