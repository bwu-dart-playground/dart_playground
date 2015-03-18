import 'dart:async';
import 'package:observe/observe.dart';
class MyOtherModel extends Object with Observable {
  @observable
  String value;
}

class MyModel extends Object with Observable {
  StreamSubscription _sub;
  MyOtherModel _otherModel = new MyOtherModel();

  MyModel() {

    ///...
    _otherModel.changes.listen((crs) {
        crs.forEach((PropertyChangeRecord cr) => notifyPropertyChange(#prop, cr.oldValue, cr.newValue));
    });
  }

  String get prop => _otherModel.value;
  set prop(String value) => _otherModel.value = value;
}

void main() {
  MyModel m = new MyModel();
  m.prop = 'bla';
  m.changes.listen(print);
  Observable.dirtyCheck();
}
