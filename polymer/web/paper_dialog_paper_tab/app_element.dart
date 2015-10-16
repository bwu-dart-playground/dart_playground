import 'package:polymer/polymer.dart';
import 'package:paper_elements/paper_dialog.dart';
import 'dart:js' as js;
import 'dart:async' show Future;

@CustomTag('app-element')
class AppElement extends PolymerElement {

  AppElement.created() : super.created();

  @observable
  int selected = 0;

  void handleOpenClick(e) {
    ($['dialog']as PaperDialog).opened =true;
  }

  notifyResize() {
    ($['dialog'] as PaperDialog).notifyResize();
     print('"notifyResize" called.');
   }

  open() {
     $['dialog'] as PaperDialog..open();
   }

  @override
  void attached() {
    super.attached();
    $['dialog'].on['core-overlay-open-completed'].listen((e) {
      handleDialogOpen(e);
    });
  }
//
  selectedChanged(a, b) {
    handleDialogOpen(null);
  }

  void handleDialogOpen(e) {
    new Future.delayed(const Duration(milliseconds: 100), () => new js.JsObject.fromBrowserObject($['dialog']).callMethod('notifyResize', []));
    ($['dialog'] as PaperDialog).jsElement.callMethod('notifyResize', []);
    print('notifyResize');
  }

}
