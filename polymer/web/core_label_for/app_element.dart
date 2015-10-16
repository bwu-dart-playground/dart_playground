//@HtmlImport('custom_one.html')
//@HtmlImport('custom_two.html')
import 'package:polymer/polymer.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  @observable String forTarget = 'blabla';
}
