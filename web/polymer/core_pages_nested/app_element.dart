import 'package:polymer/polymer.dart';

/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  @observable
  int selectedPages = 0;

  @observable
  int selectedSubPages = 0;

  void increasePages() {
    selectedPages = (selectedPages + 1)%3;
  }

  void increaseSubPages() {
    selectedSubPages = (selectedSubPages + 1)%3;
  }

//  @observable
//  int selectedPages = 0;

//  int _selectedSubPages = 0;
//  @ComputedProperty('selectedPages')
//  int get selectedSubPages {
//    if (selectedPages != 2) {
//      return -1;
//    } else {
//      return _selectedSubPages;
//    }
//  }
//  set selectedSubPages(int value) => _selectedSubPages = value;
//
//
//  void increasePages() {
//    selectedPages = (selectedPages + 1)%3;
//  }
//
//  void increaseSubPages() {
//    selectedSubPages = notifyPropertyChange(#selectedSubPages, selectedSubPages, (selectedSubPages + 1)%3);
//  }
}
