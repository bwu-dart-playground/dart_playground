import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:template_binding/template_binding.dart';


Map<String, dynamic> $;
main() {
  initPolymer().run(() {
    Polymer.onReady.then((_) {
      var template = document.querySelector('template') as Polymer;
      $ = template.$;
      templateBind(template).model = new MyModel();
    });
  });
}

class MyModel extends Observable {
  @observable String value = 'something';
  buttonTap() {
    print($['mybutton'].id);
    print('tap!');
  }
}
