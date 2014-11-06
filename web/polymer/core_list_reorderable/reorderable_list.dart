import 'package:polymer/polymer.dart';
import 'package:core_elements/core_list_dart.dart';

@CustomTag('reorderable-list')

class ReorderableList extends PolymerElement {

  /// Constructor used to create instance of ReorderableList.
  ReorderableList.created() : super.created();

  @PublishedProperty(reflect: true)
  List<String> data;

  attached() {
    super.attached();
    var template = querySelector('template');
    var coreList = (shadowRoot.querySelector('core-list-dart') as CoreList);
    coreList.append(template);
  }
}
