import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  @observable
  final List<Page> pages = <Page>[new Page('Page 1'), new Page('Page 2'), new Page('Page 3')];

}

class Page extends Object {
  String name;

  Page(this.name);

  String toString() {
    return name;
  }
}
