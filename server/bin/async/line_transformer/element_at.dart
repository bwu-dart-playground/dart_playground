import 'dart:async';

//int _i = 0;

Future myGetNextValueFn(Stream s) {
  Completer c = new Completer();
  s.elementAt(0).then(c.complete);
  return c.future;
}

main() async {
  StreamController controller = new StreamController.broadcast();
  Stream stream = controller.stream;

  Completer c = new Completer();
  Future value1 = myGetNextValueFn(stream);
  value1.then((val) {
    print('value1: $val');
    return myGetNextValueFn(stream).then((val) {
      print('value2: $val (1)');
    }).then((_) {
      myGetNextValueFn(stream).then((val) => print('value2: $val (2)'));
      c.complete();
    });
  });

  for (var c in 'abcdefghijklmnop'.runes) {
    new Future.delayed(Duration.ZERO, () => controller.add(new String.fromCharCode(c)));
    print('c: ${new String.fromCharCode(c)}');
  }

  var x = await c.future;
  print('x: $x');
}
