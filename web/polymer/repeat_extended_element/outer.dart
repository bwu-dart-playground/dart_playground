import 'package:polymer/polymer.dart';

@CustomTag('outer-element')
class OuterElement extends PolymerElement {

  final List fruits = toObservable(['apples', 'pears', 'bananas']);

  OuterElement.created() : super.created() {
  }
}
