library x;

//import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('my-select')
class MySelect extends PolymerElement {
  @observable List<int> dataAr = toObservable(<String>['Günter', 'Heidi', 'Gitti', 'Berta', 'Alois']);
  @observable var value;
  @observable var selected;

  @observable var values = toObservable(<String>[]);
  @observable var sel = toObservable([false, false, false, false, false, false, false, false]);

  MySelect.created() : super.created() {
    print('MySelect');
  }

  void on_change(event, details, Element target) {
    var el = (shadowRoot.querySelector('select') as SelectElement);

    var v = <String>[];
    el.options.forEach((o) => o.selected ? v.add(o.value) : null);
    values.clear();
    values.addAll(v);
  }

  void option_selected(event, details, Element target) {
    print('option_selected: ${selected}');
  }

  void selectedChanged(old) {
    print('selectedChange: ${selected}');
  }
}