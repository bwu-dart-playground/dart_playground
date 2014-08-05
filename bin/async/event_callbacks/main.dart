import 'dart:async';

class Person {
  Stream onNameChange;
  StreamController _controller = new StreamController.broadcast();
  Person() {
    onNameChange = _controller.stream;
  }

  String _name;
  String get name => _name;
  set name(String val) {
    _name = val;
    _controller.add(val);
  }
}

void main() {
  var p = new Person();
  p.name = "someName";
  StreamSubscription nameChangeSubscr = p.onNameChange.listen((e) => print('name changed: $e'));


  var i = 0;
  new Timer.periodic(new Duration(milliseconds: 300), (Timer t) {
    if(i > 5) {
      t.cancel();
      if(nameChangeSubscr != 0) nameChangeSubscr.cancel();
    }
    p.name = "name ${i++}";
  });
}