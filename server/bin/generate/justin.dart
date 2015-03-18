import 'dart:math' show pow;
import 'package:quiver/strings.dart' show padLeft;

main() {
  Stopwatch sw = new Stopwatch();
  sw.start();

  int digits = 4;
  int base = 6;
  var result = new Iterable.generate(pow(base, digits),
      (i) => padLeft(i.toRadixString(base), digits, '0').split('').map(int.parse));

  int i = 0;
  result.forEach((e) => i++);
  sw.stop();
  print('elapsed: ${sw.elapsed}');
  print(i);
  //result.forEach(print);
}