import 'dart:io';
import 'dart:async';
import 'dart:typed_data';

main() async {
  final server = await ServerSocket.bind('127.0.0.1', 4041);
  server.listen((Socket socket) {
    print('Got connected ${socket.remoteAddress}');

    var toByte = new StreamTransformer<List<int>, Uint8List>.fromHandlers(
        handleData: (data, sink) {
      sink.add(new Uint64List.fromList(data).buffer.asUint8List());
    });

    var streamController = new StreamController<List<int>>();
    streamController.stream.transform(toByte).pipe(socket);

    for (int i = 0; i < 1024; i++) {
      streamController.add([i]);
    }
    streamController.close();
    print('Closed ${socket.remoteAddress}');
  });
}
