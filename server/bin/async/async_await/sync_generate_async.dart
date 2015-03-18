import 'dart:async' show Future, Stream, StreamController;

void main() {
  generator().take(20).forEach(print);
}

//Iterable<int> generator1() sync* {
//  int i = 0;
//  bool hasMore;
//  while(hasMore) {
//    var next = await new Future.delayed(new Duration(seconds: 1), () {
//      if(i < 100) {
//        return [i++, i++, i++, i++, i++];
//      }
//    });
//    yield next;
//  }
//}
//Stream<int> generator2() async* {
//  int i = 0;
//  bool hasMore;
//  while(hasMore) {
//    var next = await new Future.delayed(new Duration(seconds: 1), () {
//      if(i < 100) {
//        return [i++, i++, i++, i++, i++];
//      }
//    });
//    yield next;
//  }
//}

bool hasMoreData = true;

Stream<int> dataController() {
  int i = 0;
  StreamController streamController;
  streamController = new StreamController<int>(
    onListen: () {
      Future.doWhile(() {
        streamController.addStream(new Future.delayed(new Duration(seconds: 1), () => i++).asStream());
      });
    }, onPause: () {}, onResume: () {}, onCancel: () {});
  return streamController.stream;
}

//Stream<int> generator() async* {
//  int i = 0;
//  bool hasMore;
//  while(hasMore) {
//    var next = await new Future.delayed(new Duration(seconds: 1), () {
//      if(i < 100) {
//        return [i++, i++, i++, i++, i++];
//      }
//    });
//    yield next;
//  }
//}
