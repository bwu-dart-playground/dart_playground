import 'package:polymer/polymer.dart';
import 'dart:html';
import 'dart:async';

@CustomTag('toggle-el')
class toggleElement extends PolymerElement {
  @observable String name = 'Dartgnan';
  @observable bool editMode = false;

  toggleElement.created() : super.created();

  @override ready();

  void switchEdit(Event ev, var detail, Node sender) {
    print('editMode: $editMode, $ev');
    editMode = !editMode;
    print('edit mode is now ${editMode ? 'on' : 'off'}');
    if (editMode) {
      InputElement el = $['nmInput'];
      new Future(() => el.focus());
      el.selectionStart = 0;
      el.selectionEnd = 999;
    }
  }
}
