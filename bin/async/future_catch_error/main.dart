import 'dart:async';

void main() {

  var fur1 = new Future<int>(() => 45);
  fur1.then((value) {
    throw new StateError('Hello1 error');
  }).catchError((err) => print('catchError1: ${err}'));

  var fur2 = new Future<int>(() => 24);
  fur2.then((value) {
    var x = fur1.then((value1) {
      print(value1);
      throw new StateError('Hello2 error');
    });
    print(value);
    return x;
  }).catchError((err) => print('catchError2: ${err}'));
}