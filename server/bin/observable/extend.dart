import 'package:observe/observe.dart';

//class Persistent extends Observable {
//  bool changed = false;
//
//  Persistent() : super() {
//    changes.listen((e) => changed = true);
//  }
//}

class Persistent extends ChangeNotifier {
  bool changed = false;

  Persistent() : super() {
    changes.listen((e) => changed = true);
  }
}

class Child extends Persistent {
  @observable num number = 1;
}

main() {
  Child item = new Child();
  item.number = 2;
  Observable.dirtyCheck();
  assert(item.changed == true);
}