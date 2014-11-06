import 'package:polymer/polymer.dart';

import 'package:core_elements/core_item.dart';
/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  @published var item;
  @published var subItem;

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  void itemChanged(oldVal, newVal) {
    print(item);
  }

  void subItemChanged(oldVal, newVal) {
    print(subItem);
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
