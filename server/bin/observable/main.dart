import 'package:observe/observe.dart';

class Notifiable extends Object with ChangeNotifier {
  String _input = '';

  @reflectable
  get input => _input;

  @reflectable
  set input(val) {
    _input = notifyPropertyChange(#input, _input, val + " new");
  }

  Notifiable() {
    this.changes.listen((List<ChangeRecord> record) => record.forEach(print));
  }
}

class MyObservable extends Observable {
  @observable
  String counter = '';

  MyObservable() {
    this.changes.listen((List<ChangeRecord> record) => record.forEach(print));
  }
}

void main() {
  var x = new MyObservable();
  x.counter = "hallo";
  Observable.dirtyCheck();

  Notifiable notifiable = new Notifiable();
  notifiable.input = 'xxx';
  notifiable.input = 'yyy';
}


