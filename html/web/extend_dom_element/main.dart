library x;

import 'dart:async' show Future, Stream;
import 'dart:html';
import 'dart:js' as js;

void main() {
  //document.body.append(new MyElement.created());

  MyObjectElement.register();
  var obj = new MyObjectElement()
    ..data =
    "https://www.suntico.com/wp-content/uploads/DemoStampRotate01-e1400242575670.png";
  document.body.append(obj);
  new Future.delayed(Duration.ZERO, () => print(obj.contentDocument));
}

//class MyElement extends DivElement {
//  MyElement.created() : super.created() {
//    print('hallo');
//  }
//}

class MyObjectElement extends ObjectElement {
  static bool _isRegistered = false;

  static register() {
    if (!_isRegistered) {
      document.registerElement('my-object', MyObjectElement,
          extendsTag: 'object');
      _isRegistered = true;
    }
  }

  factory MyObjectElement() {
    var result = document.createElement('object', 'my-object');
    return result;
  }

  MyObjectElement.created() : super.created();

  js.JsObject get contentDocument {
    return new js.JsObject.fromBrowserObject(this)['contentDocument'];
  }
}
