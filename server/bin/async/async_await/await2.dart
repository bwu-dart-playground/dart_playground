import 'dart:async' show Future, Stream;

//import 'package:defer/library1.dart' deferred as lib1;

Future<int> delay() async {
  //return new Future.value('15'); //delayed(new Duration(seconds: 1), () => 15);
  return 15;
}

void main() async {
//  someDelay().then((x) => print(x));
  var b = await delay();
  var a = 'x';
  print("$a, $b");
}
