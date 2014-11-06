import 'package:polymer/polymer.dart';
import 'dart:html' as dom;

import 'foo.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  @observable
  var selectedx;

  @observable
  List<Foo> data = toObservable(<Foo>[new Foo('alpha'), new Foo('beta'), new Foo('gamma')]);

  selectedxChanged(oldVal, newVal) {
    print(newVal);
  }

  void activateHandler(dom.CustomEvent e) {
    print(e.detail.data);
  }
}

