library x;

import 'dart:async';

typedef Future<String> Next(String opt1, String opt2);

class Sender {
  Stream<Next> get onSendMessageA => _sendMessageA.stream;
  final _sendMessageA = new StreamController<Next>.broadcast();

  sendMessage(fn) => _sendMessageA.add(fn);
}

void main(List<String> args) {
  var sender = new Sender()
    ..onSendMessageA.listen((f) {
      f('option1', 'option2')
      .then((value) => print('value: $value'));
    });


  sender.sendMessage(fn);
}

Future<String> fn(String opt1, String opt2) {
  print('opt1: $opt1');
  print('opt2: $opt2');
  return new Future.value('$opt1 - $opt2');
}