import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:js' as js;

@CustomTag('main-view')
class MainView extends PolymerElement {
  MainView.created() : super.created();
  void pdfGenerator(Event e, var detail, Node node) {
    var doc = new js.JsObject(js.context['jsPDF'], ['portrait', 'pt', 'a4']);
    var myHtml = shadowRoot.querySelector('#test_pdf');
    //var myHtml = new JsObject.fromBrowserObject(document).callMethod('querySelector', ['* /deep/ #test-pdf']);
    doc.callMethod('fromHTML', [myHtml, 0, 0, null, null, null]);
    doc.callMethod('save', ['testfile.pdf']);
  }
}
