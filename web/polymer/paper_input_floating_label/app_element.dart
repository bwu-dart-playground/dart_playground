import 'dart:js' as js;
import 'dart:async' as async;
import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_input.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
  }

  addPerson(_) {
    // Add the person
    // ...

    // Clear the inputs
    var inp = $['alias-input'] as PaperInput;
    inp.inputValue = '';
//    new js.JsObject.fromBrowserObject(inp).callMethod('inputBlurAction', []);
    inp.querySelector('* /deep/ #input')
    ..focus()
    ..blur();
    // var xinp = (inp as PolymerElement).$['input']; // doesn't work because inp isn't a PolymerElement but a DomProxyMixin

//    var xinp = inp.$['input'].focus();
//    xinp.focus();
//    xinp.blur();
//    ($['alias-input'] as PaperInput)..inputValue = null..commit()..blur();
//    ($['birth-year-input'] as PaperInput)..inputValue = null..commit()..blur();
  }
}
