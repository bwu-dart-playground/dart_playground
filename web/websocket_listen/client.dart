import 'dart:html';
import 'dart:async';

WebSocket ws;

outputMsg(String msg) {
  //var output = query('#output');
  var text = msg;
  print(msg);
//  if (!output.text.isEmpty) {
//    text = "${output.text}\n${text}";
//  }
//  output.text = text;
}

void initWebSocket([int retrySeconds = 2]) {
  var reconnectScheduled = false;

  outputMsg("Connecting to websocket");
  ws = new WebSocket('ws://echo.websocket.org');

  void scheduleReconnect() {
    print('reschedule');
    if (!reconnectScheduled) {
      new Timer(new Duration(milliseconds: 1000 * retrySeconds), () => initWebSocket(retrySeconds * 2));
    }
    reconnectScheduled = true;
  }

  ws.onOpen.listen((e) {
    outputMsg('Connected');
    ws.send('Hello from Dart!');
  });

  ws.onClose.listen((e) {
    outputMsg('Websocket closed, retrying in $retrySeconds seconds');
    scheduleReconnect();
  });

  ws.onError.listen((e) {
    outputMsg("Error connecting to ws");
    scheduleReconnect();
  });

  ws.onMessage.listen((MessageEvent e) {
    outputMsg('Received message: ${e.data}');
  });
}

void main() {
  var x = new Element.tag('div');

  //initWebSocket();
  //ws = new WebSocket('ws://echo.websocket.org');
  ws = new WebSocket('ws://127.0.0.1:4949');
  ws.onOpen.first.then((_) {
    print('open');
    ws.onMessage.listen((MessageEvent e) => print('received: ${e.data}'));
    ws.onClose.listen((_) => print('closed'));
    ws.onError.listen((_) => print('error'));
    ws.send('some data');
  });

  print('end');
}