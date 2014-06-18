import 'dart:math' as math;

methodname(num radians) {
  int r = (radians * 1000).round();
  const myPI = 3142;
  switch (r) {
    case 0:
      print(0);
      break;
    case myPI: // not sure if this works, I'll check and update the answer
      // do something else
      print('PI');
      break;
  }
}

void main() {
  print (math.PI);
  methodname(0.00000001);
  methodname(math.PI);
}