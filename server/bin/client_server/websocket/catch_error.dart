import 'dart:async';
import 'dart:io';

main() async {
  // Connect to a web socket.
  WebSocket s = await WebSocket.connect('ws://echo.websocket.org');
  Stream socket = s.handleError((e) {
    print(e);
  });

  // Setup listening.
//  Completer done = new Completer();
  StreamSubscription sub = socket.listen((message) {
    print('message: $message');
  }, onError: (error) {
    print('error: $error');
  }, onDone: () {
    print('socket closed.');
//    done.complete();
  }, cancelOnError: true);

  Future f = sub.asFuture();
  sub.onError((e) {
    print(e);
  });
  f.catchError((e) {
    print(e);
  });


  // Add message, and then an error.
  s.add('echo!');
  s.addError(new Exception('error!'));

  await f;

  // Wait for the socket to close.
}
