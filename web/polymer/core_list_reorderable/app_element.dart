import 'package:polymer/polymer.dart';

class Item {
  String name;
  Item(this.name);
  bool selected = false;

  String toString() => name;
}

@CustomTag('app-element')

class AppElement extends PolymerElement {

  @observable
  List strings = toObservable([new Item('Anton'), new Item('Berta'), new Item('Caesar'), new Item('Dora')]);

  AppElement.created() : super.created();
}
