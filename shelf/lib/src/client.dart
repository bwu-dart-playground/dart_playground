library shelf_playground.src.client;

import 'dart:async' show Future;
import 'package:http/http.dart' as http;

class Client {
  final String serverUri;
  Client(this.serverUri);
  final headers = {
    'content-type': 'application/json',
    'response-type': 'application/json'
  };

  Future<String> simpleRequest(String body) {
    return new http.Client()
        .post(serverUri, headers: headers, body: body)
        .then((response) => response.body);
  }
}
