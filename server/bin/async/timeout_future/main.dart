import 'dart:async';

main() async {
  print(await decimalToFractional(123456789.123456789));
}

Future<String> decimalToFractional(double d) {
  var df = 1.0;
  var top = 1;
  var bot = 1;

  bool timedOut = false;

  return new Future<String>(() async {
    while (df != d && !timedOut) {
      await new Future(() {
        if (df < d) {
          top += 1;
        } else {
          bot += 1;
          top = (d * bot).toInt();
        }
        df = top / bot;
      });
    }
    print('return xx');
    return '$top/$bot';
  })
    ..timeout(new Duration(seconds: 1), onTimeout: () {
      print('timed out');
      timedOut = true;
      return d.toString();
    });
}
