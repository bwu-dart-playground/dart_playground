import 'dart:io' as io;

void main() {
  io.HttpServer.bind(io.InternetAddress.ANY_IP_V6, 33333)
  .then((server) {
    server.listen((request) {
      print(request.connectionInfo.remoteAddress.address);
      request
        ..response.write('Echo from server')
        ..response.close();
    });
  });
}
