import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main(List<String> arguments) {

  Stream<List<int>> stream = new File("input.txt").openRead();

  StreamSubscription x = stream.transform(UTF8.decoder.fuse(const LineSplitter()))
      .listen((line) {
        stdout.writeln(line);
      }, onDone: () {
          print("done");
      }, onError: (e) {
        print('error: $e');
      });


  x.cancel();

}