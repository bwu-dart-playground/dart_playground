import 'dart:isolate';

void main(List<String> args) {
  SendPort sendPort = (args[0] as SendPort);
  var receivePort = new ReceivePort();
  sendPort.send(receivePort.sendPort);
  // keeps the isolate alive at least until the first messgae arrives
  receivePort.first.then((e) => print('isolate received: $e'));
}
