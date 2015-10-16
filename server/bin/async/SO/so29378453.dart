import 'dart:async';

main() async {
  try {
    await divide(1, 0)
        .then((result) => print('1 / 0 = $result'));

  } catch (error) {
    print('Error occured during division: $error');
  }
}

Future<double> divide(int a, b) {
  return new Future(() {
    if (b == 0) {
      throw new Exception('Division by zero');
    }
    return a / b;
  });
}
