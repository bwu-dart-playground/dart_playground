library app_element;

import 'package:polymer/polymer.dart';
import 'package:core_elements/core_drawer_panel.dart' show CoreDrawerPanel;
import 'dart:html';
import 'dart:js' show JsObject, context;

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  void toggleDrawer() {
    $['drawerPanel'].togglePanel();
  }
}
