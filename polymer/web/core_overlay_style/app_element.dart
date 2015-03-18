import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  void openOverlayHandler(dom.MouseEvent e) {
    $['overlay'].attributes['opened'] = true.toString();
  }

  void signInWithFacebook(dom.MouseEvent e) {

  }

}
