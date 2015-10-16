import 'package:polymer/polymer.dart';
import 'dart:html' as dom;

@CustomTag('init-item')

class InitItem extends PolymerElement {

  factory InitItem() => new dom.Element.tag('init-item');

  InitItem.created() : super.created();

  @observable
  String Name='hello';

//  void removeItem(e) {
//    remove();
//  }
}
