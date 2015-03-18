import 'package:observe/observe.dart';

class Reapeat extends Object with Observable {
  @observable String searchTerm;
  @observable List<String> items = ['Monday', 'Tuesday', 'Wdnesday'];

  void searchTermChanged(oldVal) {
    items = items.where((String item) {
      if (searchTerm.isEmpty) return true;
      return item.toLowerCase().contains(searchTerm.toLowerCase());
    }).toList(growable: false);
  }


}

void main(List<String> args) {
}