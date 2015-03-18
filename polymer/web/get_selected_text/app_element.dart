import 'package:polymer/polymer.dart';

import 'dart:html' as dom;
@CustomTag('app-element')
class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  void attached() {
    super.attached();
    this.onMouseUp.listen(mouseUpHandler);
  }

  void mouseUpHandler(dom.MouseEvent e) {
    print('document');
    print(dom.window.getSelection().getRangeAt(0).cloneContents().innerHtml);
    print(dom.window.getSelection().getRangeAt(0).cloneContents().text);
    print('shadow');
    print(shadowRoot.getSelection().getRangeAt(0).cloneContents().innerHtml);
    print(shadowRoot.getSelection().getRangeAt(0).cloneContents().text);
    //print(this.getSelection());
  }
}
