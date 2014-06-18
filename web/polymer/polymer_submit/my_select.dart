library x;

import 'package:polymer/polymer.dart';


import 'dart:html';

@CustomTag('my-select')
class LanguageComboForm extends PolymerElement {
  @observable String lang = '';

  List<String> langs = ['', 'Basque', 'Bulgarian', 'Catalan',
      'Chinese - Simplified'];

  LanguageComboForm.created() : super.created();

  bool get applyAuthorStyles => true;

  void submit(Event e, var detail, Node target) {
    //$['submit-btn'].click();

    //$['form'].onSubmit.listen((Event e) {
      e.preventDefault();

      dispatchEvent(new CustomEvent('submit', detail: {
        'lang': lang
      }));

      print('submitted from onSubmit: $lang');
    //});
  }


}
