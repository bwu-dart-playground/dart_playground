import 'package:polymer/polymer.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  ready() {
    print('Last name: ${$["globals"].values["lastName"]}');
  }
}
