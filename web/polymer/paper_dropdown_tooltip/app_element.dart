import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  @observable
  List<String> countries = ['Albania', 'Germany', 'Great Britain', 'Italy', 'Switzerland'];

  attached() {
    super.attached();
  }
}
