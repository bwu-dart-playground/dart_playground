import 'package:polymer/polymer.dart';

import 'dart:js' as js;
import 'package:custom_element_apigen/src/common.dart';

/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement with DomProxyMixin {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  @observable
  var selectedItem;

  void selectedItemChanged(var oldVal, var newVal) {
    print(newVal);
  }

  void selectedItemHandler(event, detail, target) {
    //var d = new js.JsObject(detail);
    print(detail['isSelected']);
    var item = new js.JsObject.fromBrowserObject(detail['item']);
    print(item);
  }

  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of app-element is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of app-element is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// app-element is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }

  /// Called when app-element has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
  }

  */

}
