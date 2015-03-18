import 'dart:mirrors';

class Private {
  String _s = 'somePrivateValue';
  int _double(int val) => val * 2;
}

void main() {
  var p = new Private();
  var cm = reflect(p);
  cm.type.getField()
  print('s ${cm.type.getField(new Symbol('_s'))}');
  print('double: ${cm.invoke(new Symbol('_double'), [50])}');
  print('s ${cm.getField(new Symbol('_s'))}');
}
