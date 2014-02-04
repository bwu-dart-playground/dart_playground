library playground.shadow_element.my_window_example;

//import 'dart:async' show StreamSubscription, Timer;
import 'dart:html' as dom;
import 'package:polymer/polymer.dart' show CustomTag, override, observable, PolymerElement, published, toObservable,
  ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved

import 'my_window.dart';

@CustomTag('my-window-example')
class MyWindowExample extends MyWindow {
  MyWindowExample.created() : super.created() {
    print('MyWindowExample');
  }
}
