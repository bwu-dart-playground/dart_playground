import 'dart:io' as io;
import 'dart:async' show Future, Stream, StreamSubscription;
import 'dart:convert' show UTF8;

void main() {
  StreamSubscription subscr = io.stdin.transform(UTF8.decoder).listen((data) => print(data));
}
