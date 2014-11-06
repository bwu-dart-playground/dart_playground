import 'package:polymer/polymer.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {

  @observable
  Map map = toObservable({'123': {'name': 'XYZ', 'size': 12}});

    AppElement.created() : super.created();

  void change() {
    var object = map['123']['size'] = 100;
  }
}
