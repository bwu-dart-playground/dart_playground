library test_element;

import 'dart:async';
import 'package:polymer/polymer.dart';

class Fruit {}
class Banana extends Fruit {}
class Apple extends Fruit {}

@CustomTag('test-element')
class TestElement extends PolymerElement {

  TestElement.created() : super.created() {
    print('PeopleElement');
  }

  @observable bool show = true;


  void hide() {
    show = false;
  }

  bool isOf(Fruit value, Type t) {
    return true; //value is t;
  }

  isBanana(Fruit fruit) => fruit is Banana;
  isApple(Fruit fruit) => fruit is Apple;

  List<Fruit> fruits = [new Banana(), new Banana(), new Apple(), new Apple(), new Banana()];

}

