import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  attached() {
    $
    super.attached();
    var inp = $['pi'].querySelector('* /deep/ input') as dom.TextInputElement;
    inp.parentNode.append($['dl']);
    inp.attributes['list'] = 'dl';
  }
}
