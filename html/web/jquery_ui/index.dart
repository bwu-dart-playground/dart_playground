import 'dart:html';
import 'dart:js' as js;

void main() {
  js.JsObject slider_1 = js.context.callMethod("\$", ['#slider-1']);
  slider_1.callMethod('slider');
  slider_1.callMethod("on",["slidechange",_onSliderChange]);
}

void _onSliderChange(js.JsObject obj1,js.JsObject obj2) {
  DivElement current = obj1['currentTarget'];
  print(current is DivElement);
  DivElement target = obj1['target'];
  SpanElement toElement = obj1['toElement'];
  SpanElement handle = obj2['handle'];
  int value = obj2['value'];
  //var x = new js.JsObject.fromBrowserObject(obj1[0]);
  //var y = new js.JsObject.fromBrowserObject(obj2[0]);

}
