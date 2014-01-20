import 'package:polymer/polymer.dart';
import 'dart:html';

@CustomTag('my-element')
class MyElement extends DivElement with Polymer, Observable {
  MyElement.created() : super.created();

  void showMessage(Event e, var detail, Node target) {
    // shadowRoot is the root of the internals of the custom element

    shadowRoot.querySelector('#show').style.display = 'inline';
    shadowRoot.querySelector('#hide').style.display = 'none';
  }

  void hideMessage(Event e, var detail, Node target) {
    shadowRoot.querySelector('#show').style.display = 'none';
    shadowRoot.querySelector('#hide').style.display = 'inline';
  }
}