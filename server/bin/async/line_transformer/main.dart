import 'dart:convert';
import 'dart:async' show Future, Stream;
import 'dart:math' show Random;

import "dart:async";
import "dart:collection";


//int i
//Future myGetNextValueFn(Stream s) {
//  Completer c = new Completer();
//  s.elementAt(_i++).then(c.complete);
//  return c.future;
//}

final rnd = new Random();
main() async {


  var stream = lineStream()
      .take(8)
      .transform(new Utf8Decoder()).asBroadcastStream();
      //.transform(new LineSplitter())
      //.take(20));


      //.listen((line) => print(line));
  //var iter = wrapper1.iterator;
  for(int i = 0; i < 10; i++) {
    try {
    var result = await stream.elementAt(i);
    //if(iter.moveNext()) {
      //var result = await iter.current;
      print('$i: $result');
    //} else {
    } catch(e) {
      print('Stream closed: $e');
    }
  }

//  var stream2 = lineStream()
//        .take(8)
//        .transform(new Utf8Decoder());
//
//  var counter = 0;
//
//  for(var f in stream2.elementAt(i++)) {
//    var result = await f;
//    print('$counter: $result');
//    counter++;
//  }
}

Stream<List<int>> lineStream() async* {
  while (true) {
    yield intList().take(rnd.nextInt(100)).toList();
  }
}

Iterable<int> intList() sync* {
  final listLength = rnd.nextInt(100);
  for (int i = 0; i < listLength; i++) {
    final nextVal = rnd.nextInt(100);
    if (nextVal % ~50 == 0) {
      for (int cu in '||||||>>>>>\n<<<<<'.codeUnits) {
        yield cu;
      }
    }
    yield nextVal >= 30 ? nextVal : 30;
  }
}

//class StreamToIterable<T> extends IterableBase {
//  Queue<Completer<T>> _completers = new Queue<Completer<T>>();
//  Queue<T> _values = new Queue<T>();
//  bool _isOpen = false;
//  bool get isOpen => _isOpen;
//
//  _addValue(T value) {
//    _values.add(value);
//    _update();
//  }
//
//  _update() {
//    while (_completers.isNotEmpty && _values.isNotEmpty) {
//      Completer<T> completer = _completers.removeFirst();
//      T value = _values.removeFirst();
//      completer.complete(value);
//    }
//  }
//
//  Iterator<Future<T>> get iterator => iterable.iterator;
//
//  Iterable<Future<T>> get iterable sync* {
//    while (isOpen || _values.isNotEmpty) {
//      var complete = new Completer<T>();
//      _completers.add(complete);
//      _update();
//      yield complete.future;
//    }
//  }
//
//  StreamToIterable(Stream<T> stream) {
//    stream.listen(_addValue,
//        onDone: () => _isOpen = false, onError: (_) => _isOpen = false);
//    _isOpen = true;
//  }
//}
