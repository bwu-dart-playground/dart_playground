import 'dart:mirrors';

var name = 'Andre';

var fn = (p) => p.firstName == name;

Map temp = new Map();

void main() {
  var x = (reflect(fn) as ClosureMirror);
  var y = x.function;
  print(y.source);
  print(x);
}
