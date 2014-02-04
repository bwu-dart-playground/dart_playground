library playground.shadow_element.my_window;

//import 'dart:async' show StreamSubscription, Timer;
import 'dart:html' as dom;
import 'package:polymer/polymer.dart' show CustomTag, override, observable, PolymerElement, published, toObservable,
  ChangeNotifier, reflectable; // TODO remove ChangeNotifier, reflectable when bug is solved

@CustomTag('my-window')
class MyWindow extends PolymerElement {
  MyWindow.created() : super.created() {
    print('MyWindow');
  }
}
