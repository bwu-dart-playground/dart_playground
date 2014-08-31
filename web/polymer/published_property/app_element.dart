import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  String _counter = '00:00';
  @PublishedProperty(reflect: true)
  String get counter => _counter;
  void set counter (String s){
    _counter = s;
    print('update s: $s');
  }

}
