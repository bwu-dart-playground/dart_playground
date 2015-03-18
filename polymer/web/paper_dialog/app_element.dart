import 'package:polymer/polymer.dart';

import 'dart:html';
import 'package:paper_elements/paper_dialog.dart';
/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  void openClickHandler(Event e) {
    print(e);
    ($['autom_desc_dialog'] as PaperDialog).opened = true;
  }

  void closeClickHandler(Event e){
    if(false) {
      ($['autom_desc_dialog'] as PaperDialog).opened = false;
    }
  }

}
