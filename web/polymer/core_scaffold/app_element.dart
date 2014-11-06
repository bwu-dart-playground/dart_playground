import 'package:polymer/polymer.dart';
import 'dart:html';
/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {  }

  @observable var route = 'one';
  @observable List<dynamic> pages = [
      {'name': 'Single', 'hash': 'one'},
      {'name': 'page', 'hash': 'two'},
      {'name': 'app', 'hash': 'three'}
  ];

  void attached() {
    super.attached();
  }

  routeChanged(oldVal, newVal) {
    print(newVal);
  }
}
