library x;

import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class LanguageComboForm extends PolymerElement {
  @observable String lang = '';

  List<String> langs = ['', 'Basque', 'Bulgarian', 'Catalan',
      'Chinese - Simplified'];

  LanguageComboForm.created() : super.created();

  void attached() {
    super.attached();
    dom.DataListElement o = $['langs'];
    print(o.innerHtml);
    print(o.options);
  }

  void submit(dom.Event e, var detail, dom.Node target) {
//    e.preventDefault();
//    dispatchEvent(new CustomEvent('submit', detail: {
//      'lang': lang
//    }));
//
//    print('submitted from onSubmit: $lang');
  }


}
