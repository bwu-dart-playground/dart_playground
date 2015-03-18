import 'dart:html';
import 'dart:convert';

void main() {
  querySelector(".button").onClick
    .listen( (e) {
      String url = 'http://127.0.0.1:8480';
      HttpRequest request = new HttpRequest();
      Map data = {
          "int value" : 1,
          "string value": 'Dartlang.'
      };
      String jsonData = JSON.encode(data);
      print("json data sent = " + jsonData);
      request
      ..open("POST", url, async: true)
        ..onLoadStart.listen((e) => print("Started loading"))
        ..onError.listen( (e) =>( print("Error occurred.")))
        ..onTimeout.listen((e) => (print("Server is not responding.")))
        ..onLoad.listen( (e) => (print("Response text = ${request.responseText}")))
            ..send(jsonData);
          });
}