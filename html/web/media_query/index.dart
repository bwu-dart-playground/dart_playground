//import 'dart:html' as dom;

// see http://stackoverflow.com/questions/19745361

import 'dart:html';
import 'dart:js' as js;

void main() {
  var x = new js.JsObject.fromBrowserObject(document);
  //var x = js.context['document'];
  print(x.callMethod('hasFocus', []));
  bool isMagicHappening = x is HtmlDocument;
  document.body.appendText("Magic is happening: ${isMagicHappening}");
}
//void main() {
//  dom.querySelector("#sample_text_id")
//    ..text = "Click me!"
//    ..onClick.listen(reverseText);
//  dom.window.history.pushState(null, 'abc');
//  var mq = dom.window.matchMedia("(min-width: 500px)");
//  mq.media.
//
//}
//
//void reverseText(MouseEvent event) {
//  var text = querySelector("#sample_text_id").text;
//  var buffer = new StringBuffer();
//  for (int i = text.length - 1; i >= 0; i--) {
//    buffer.write(text[i]);
//  }
//  querySelector("#sample_text_id").text = buffer.toString();
//}
