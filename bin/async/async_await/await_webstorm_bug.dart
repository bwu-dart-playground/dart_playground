import 'dart:async' show Future;

Future<int> someAsync(int val) {
  return new Future.value(val);
}

Future testMain(int val) async {
  return someAsync(val + 1).then((x) async {
    var x = 0;
    if(val > 3) {
      x = await someAsync(val); // <= error
    }
    return x++;
  });
}

main() async {
  testMain(5);
  var x = await someAsync(5);
  print(x);
}
