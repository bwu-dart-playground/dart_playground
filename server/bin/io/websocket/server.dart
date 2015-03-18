import 'dart:io' as io;
import 'dart:async' show Future, Stream, runZoned;

// see http://dartbug.com/22583

void main() {
  io.ServerSocket.bind(
      io.InternetAddress.ANY_IP_V4,
      9000).then((io.ServerSocket server) {
    //runZoned(() {
      server.listen(handleClient, onDone: () {
        print('Client closed:');
      });
    } ,onError: (e) {
      print('Server error: $e');
    });
  //});
  new Future.delayed(new Duration(seconds: 3), ()  => client());

}

void handleClient(io.Socket client) {
  client.listen(print, onDone: () {
    print('On done');
    client.close();
  }) ;
  client.done.then((_) {
    print('Stop sending');
  });
  print('Send data');
}


void client() {
  io.Socket socket;
  io.Socket.connect(io.InternetAddress.ANY_IP_V4, 9000)
  .then((s) {
    socket = s;
    socket.listen((data) {
      print(data);
    });
    new Future.delayed(new Duration(seconds: 3), () {
      print("close");
      s.destroy();
//      s.drain();
//      s.close();
    });
  });
}
