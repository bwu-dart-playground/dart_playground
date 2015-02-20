import 'package:polymer/polymer.dart';

import 'dart:html' as dom;
import 'dart:js' as js;

@CustomTag('app-element')
class AppElement extends PolymerElement {
  bool dragging = false;
  AppElement.created() : super.created();

  void trackStartHandler (dom.Event e, var detail, var target) {
    dragging = true;
    addLog('trackStart: $e');
  }

  void trackEndHandler (dom.Event e, var detail, var target) {
    dragging =  false;
    addLog('trackEnd: $e');
  }

  void trackHandler (dom.Event e, var detail, dom.Node target) {
    /* How to retrieve the mouse position or the dx property from event ??? */
    addLog('track: $e, ${detail}');
    var touchEvent = new js.JsObject.fromBrowserObject(e);
    print('x: ${touchEvent['dx']}, y: ${touchEvent['dy']}');
    //print(obj);
    //return obj;
  }

  void addLog(String msg) {
    ($['log'] as dom.DivElement).children.insert(0, new dom.DivElement()..text = msg);
  }
}
