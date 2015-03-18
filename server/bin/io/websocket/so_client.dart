import 'dart:io';
import 'dart:async';

main() async {
  final Socket client = await Socket.connect('127.0.0.1', 4041);

  var fromByte = new StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: (data, sink) {
    sink.add(data.buffer.asInt64List());
  });

  client.transform(fromByte).listen((e) => e.forEach(print));
  print('main done');
}
