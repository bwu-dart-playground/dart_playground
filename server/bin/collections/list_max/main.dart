import 'dart:math' as math;

void main() {
  var l = [10,5,11,3,7,1,0, null,15,5];

  var max = l.fold(0, (prev, curr) => math.max(prev, curr));
  print(max);

  print(l.reduce(math.max));

}