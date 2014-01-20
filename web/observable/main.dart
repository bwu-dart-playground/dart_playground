import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:observe/observe.dart';

class Notifiable extends Object with ChangeNotifier {
  String _input = '';
  @reflectable get input => _input;
  @reflectable set input(val) {
    _input = notifyPropertyChange(#input, _input, val+" new");
  }

  Notifiable() {
    this.changes.listen((List<ChangeRecord> record) => print(record.last));
  }

  void change(String text) {
    input = text;
  }
}

void main() {
  Notifiable notifiable = new Notifiable();
  Stream stdinStream = stdin;
  stdinStream
    .transform(new Utf8Decoder())
      .listen((e) => notifiable.change(e));
}