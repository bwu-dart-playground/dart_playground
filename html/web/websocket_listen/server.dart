import 'dart:io';
import 'dart:async';

main() {
  ServerSocket.bind('127.0.0.1', 4949).then((ServerSocket server) {
    server.listen((Socket client){
      print('Connection from '
          '${client.remoteAddress.address}:${client.remotePort}');
      client.write('hello from server');
    });
  });
}