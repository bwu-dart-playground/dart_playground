import 'dart:io';
import 'dart:async';
import 'package:http_server/http_server.dart';

void main() {
  print("Listening for HTTP Requests...");

  final HOST = InternetAddress.ANY_IP_V6;
  final PORT = 8480;

  HttpServer.bind(HOST, PORT).then((server) {
    server.transform(new HttpBodyHandler())
    .listen((HttpRequestBody body) {
      HttpRequest request = body.request;
      print("Recieved request from: ${request.connectionInfo.remoteAddress.address}");
      var response = request.response;
      addCorsHeaders(response);
      response.write("You sent: ${body.body}");
      response.close();
    });
  });

}

void addCorsHeaders(HttpResponse res) {
  res.headers.add("Access-Control-Allow-Origin", "*, ");
  res.headers.add("Access-Control-Allow-Methods", "POST, GET, OPTIONS");
  res.headers.add("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
}