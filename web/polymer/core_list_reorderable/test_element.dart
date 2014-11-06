import 'package:polymer/polymer.dart';

/**
 * A Polymer test-element element.
 */
@CustomTag('test-element')

class TestElement extends PolymerElement {

  /// Constructor used to create instance of TestElement.
  TestElement.created() : super.created() {
  }

  /*
   * Optional lifecycle methods - uncomment if needed.
   *

  /// Called when an instance of test-element is inserted into the DOM.
  attached() {
    super.attached();
  }

  /// Called when an instance of test-element is removed from the DOM.
  detached() {
    super.detached();
  }

  /// Called when an attribute (such as  a class) of an instance of
  /// test-element is added, changed, or removed.
  attributeChanged(String name, String oldValue, String newValue) {
  }

  /// Called when test-element has been fully prepared (Shadow DOM created,
  /// property observers set up, event listeners attached).
  ready() {
  }
   
  */
  
}
