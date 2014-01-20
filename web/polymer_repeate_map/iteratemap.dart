library x;

import 'dart:async';
import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('my-example')
class MyExample extends PolymerElement {
  @observable ObservableMap map = toObservable(new Map<int, String>());

  int i = 0;

  MyExample.created() : super.created() {
    map.changes.listen((e) => mapChanged(null));
  }

  @observable List<int> get keys => toObservable(map.keys.toList());
  @observable List<String> get values => toObservable(map.values.toList());

  void mapChanged(old) {
    print('mapChanged');
    this.notifyPropertyChange(#keys, 1, 0);
    this.notifyPropertyChange(#values, 1, 0);
  }

  void enteredView() {
    super.enteredView();
   // new Timer.periodic(new Duration(milliseconds: 2000), (e) => add());

    $['div']
    //..onClick.listen((e) => fizz(e, ""));
    ..onClick.listen(fizz);
  }

  void fizz(MouseEvent mouseEvent, [String s]) {
    print("Hello $s!");
}

  void add() {
    map[i++] = i.toString();
    print(map.toString());
  }
}