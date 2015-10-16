import 'dart:isolate';
import 'dart:async' show Future, Stream, Completer;
import 'dart:io' as io;

class Item {
  String name;
  String status;
  Item(this.name);
}

void main() {
  final items = {'a': new Item('a'), 'b': new Item('b'), 'c': new Item('c')};
  items.forEach((name, item) async {
    ReceivePort receivePort = new ReceivePort();
    SendPort sendPort = receivePort.sendPort;
    Isolate isolate = await Isolate.spawnUri(
        Uri.parse('isolate.dart'), [sendPort, name], null);
    receivePort.listen((message) {
      if (message is SendPort) {
        message.send('connected');
      } else if (message == null) {
        print("Item exited: ${item.name}");
        item.status = "stopped";
      } else {
        print("Message: ${message}");
      }
    });
    isolate.addOnExitListener(receivePort.sendPort);
    item.status = "running";
  });
}

//main() async {
//  final items = {'a': new Item('a'), 'b': new Item('b'), 'c': new Item('c')};
//
//  await Future.wait(items.keys.map((name) async {
//    Isolate isolate =
//        await Isolate.spawnUri(Uri.parse('isolate.dart'), [name], null);
//
//    items[name].status = "running";
//    ReceivePort receivePort = new ReceivePort();
//    isolate.addOnExitListener(receivePort.sendPort);
//    Completer completer = new Completer();
//    receivePort.listen((message) {
//      if (message == null) {
//        print("Item exited: ${name}");
//        items[name].status = "stopped";
//        completer.complete(name);
//      }
//    });
//    //return completer.future;
//  }));
//  print('end');
//}
