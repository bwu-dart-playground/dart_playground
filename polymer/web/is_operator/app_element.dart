import 'dart:async' as async;
import 'package:polymer/polymer.dart';


@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  @observable
  Base model;

  @override
  void attached() {
    super.attached();
    new async.Timer.periodic(new Duration(seconds:1), (_) {
      if(model is Foo) {
        model = new Bar();
      } else {
        model = new Foo();
      }
    });
  }

  String asString(value) {
    return value.runtimeType.toString();
  }
}



class Base {
  String commonProperty = 'common';

  @override
  String toString() => runtimeType.toString();
}

class Foo extends Base {
  String fooSpecificProperty = 'foospecific';
}

class Bar extends Base {
  String barSpecificProperty = 'barspecific';
}
