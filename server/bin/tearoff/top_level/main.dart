import 'other_lib.dart' as o;
import 'main.dart' as m;

int someFunc(int x, int y) => x * y;
int get val1 => 3;
int get val2 => 4;

void main() {
	var _x = m#someFunc;
  var _v1 = m#val1;
  var _v2 = m#val2;
  print('_v1: ${_v1}, ${_v1()}');
  print('_v2: ${_v2}, ${_v2()}');
  print('_x: ${_x}, ${_x(_v1(), _v2())}');

//  var _x = m#someFunc;
//   var _v1 = m#val1;
//   var _v2 = m#val2;
//   print(_x(_v1, _v2));

//  var sc = new SomeClass();
//  var scX = sc#someFunc;
//  var scV1 = sc#val1;
//  var scV2 = sc#val2;
//  print(scX(scV1(), scV2()));
}

class SomeClass {
  int someFunc(int x, int y) => x * y;
  int get val1 => 3;
  int get val2 => 4;
}
