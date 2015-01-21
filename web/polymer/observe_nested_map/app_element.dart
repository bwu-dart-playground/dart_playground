import 'package:polymer/polymer.dart';
import 'dart:async' show Future, Stream;

@CustomTag('app-element')
class AppElement extends PolymerElement {

  @observable
  Map map = toObservable({'123': {'name': 'XYZ', 'size': 12}}, deep: true);

    AppElement.created() : super.created();

  void change() {
    final tmp = map;
    map['123']['size'] = 100;
    //map['222'] = {'name': 'bla', 'size':15};
    map = null;
    new Future(() =>  map = tmp);
  }

  String asString(Map map) {
    return map.toString();
  }
}
