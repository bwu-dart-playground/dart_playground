import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  @observable
  int page = 0;

  AppElement.created() : super.created();
}
