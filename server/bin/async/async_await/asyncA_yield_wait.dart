import 'dart:async' show Future, Stream;

/* simulate an async long calculation */
Future<int> delayedCalculation(int input, {delay: 1000}) {
  return new Future.delayed(new Duration(milliseconds: delay), () {
    return input * 2;
  });
}

//Stream asyncCalc(List<int> values) async* {
//  for (var value in values) {
//    yield (await delayedCalculation(value, delay: 10));
//  }
//}

main() {
  asyncCalc([1, 2, 3]).listen((result) => print(result));
}

//But before doing so i try to use values.forEach in asyncCalc:

/// This doesn't work because nested async* isn't supported and forEach doesn't
/// return a value
Stream asyncCalc(List<int> values) async* {
  values.forEach((value) async* {
    print('yield');
    yield(await delayedCalculation(value, delay: 10));
  });
}
