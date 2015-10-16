import 'dart:html';

import 'dart:js' as js;

void main() {
  print(new js.JsObject.fromBrowserObject(js.context['window'])['opener']['name']);
}
