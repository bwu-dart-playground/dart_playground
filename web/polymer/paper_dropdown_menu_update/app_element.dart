import 'package:polymer/polymer.dart';

/**
 * A Polymer app-element element.
 */
@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {}

  @observable
  List list = [0, 1, 2];

  @observable var selected;

  void selectedChanged(oldValue, newValue) {
    print(newValue);
  }

  listChanged(oldValue, newValue){
    //$["paper-dropdown-menu"].selected = 0;
    selected = list.first;
  }

  var otherList = [3, 4, 5];
  changeList(){
    var tmp = list;
    list = otherList;
    otherList = tmp;
  }
}
