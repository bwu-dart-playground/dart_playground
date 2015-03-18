import 'package:polymer/polymer.dart';

import 'my_li.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {
  AppElement.created() : super.created();

  void clickHandler() {
    MyLi li = new MyLi();
        li
            ..text = 'blabla'
            ..classes.add("todoitem")
            ..onClick.listen((e) => e.target.remove());
    $['ul'].append(li);
  }
}
