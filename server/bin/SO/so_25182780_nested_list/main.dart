import 'dart:math' as math;

void main() {
  print(getDataParameters([], 2));
  print(getDataParameters(["John"], 2));
  print(getDataParameters(["John", 100, "Maria"], 2));
  print(getDataParameters(["John", 100, "Maria", 200], 2));
  print(getDataParameters(["John", 100, "Maria", 200, 10], 2));
}

List getDataParameters(List l, int f) {
  return new List.generate((l.length / f).ceil(), (i) => l.sublist(i * f, math.min(i * f + f, l.length)));
}