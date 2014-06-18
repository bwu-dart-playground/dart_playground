library x;

import 'dart:html' as dom;
import 'dart:async';
import 'dart:math';

class MyData {
  String name;
  String age;

  MyData(this.name, this.age);
}

void main() {

  var b = dom.querySelector('#button');
  b.onClick.listen((e) {
    b.dispatchEvent(new dom.CustomEvent('polymer-signal',detail: new MyData("Mike","99")));
  });

  dom.window.on['polymer-signal'].listen((dom.CustomEvent e) {
    print(e.detail);
  });

     // this works:
     //asyncFire('polymer-signal', detail: {'name': "foo", 'data': "Foo!"});
     //}
  //}
}
