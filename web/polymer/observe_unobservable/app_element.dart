import 'package:polymer/polymer.dart';
import 'dart:async' as async;

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  @override attached() {
    super.attached();
    protobuf.address = new Address();
  }

  // didn't find a way to make change detection work with classes that don't implement change notification

  @ComputedProperty('protobuf.address.street')
  @observable
  String get street {
    if(protobuf != null && protobuf.address != null) {
      return protobuf.address.street;
    }
    return null;
  }

  @ComputedProperty('protobuf.address.street')
  @observable
  Protobuf protobuf = new Protobuf();
}

class Protobuf {
  Address address;
}

class Address {
  async.Timer timer;
  Address() {
    timer = new async.Timer.periodic(new Duration(seconds: 1), (_) {
      street = new DateTime.now().toString();
    });
  }

  String street = 'bla';
}
