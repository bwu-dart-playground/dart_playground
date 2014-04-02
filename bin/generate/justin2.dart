import 'dart:math' show pow;

List<int> splitDigits(int i, int base, int width) {
  var digits = new List<int>.filled(width, 0);
  int digit = 0;
  while (i != 0) {
    digits[width - ++digit] = i % base;
    i = i ~/ base;
  }
  return digits;
}

main() {
  Stopwatch sw = new Stopwatch();
  sw.start();

  int digits = 4;
  int base = 6;
  var result = new Iterable.generate(pow(base, digits),
      (i) => splitDigits(i, base, digits));

  int i = 0;
  result.forEach((e) => i++);
  sw.stop();
  print('elapsed: ${sw.elapsed}');
  print(i);
//  result.forEach(print);
}