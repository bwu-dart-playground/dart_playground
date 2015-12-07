import 'dart:html';
import 'dart:convert';

void main() {
  querySelector(".button").onClick.listen((e) /*async*/ {
    String url = 'http://127.0.0.1:8480';
    Map data = {"int value": 1, "string value": 'Dartlang.'};
    String jsonData = JSON.encode(data);
    print("send json data = " + jsonData);
      HttpRequest request = new HttpRequest();
      request
      ..open("POST", url, async: true)
        ..onLoadStart.listen((e) => print("Started loading"))
        ..onError.listen( (e) =>( print("Error occurred.")))
        ..onTimeout.listen((e) => (print("Server is not responding.")))
        ..onLoad.listen( (e) => (print("Response text = ${request.responseText}")))
            ..send(jsonData);
//    await doRequest(url, jsonData);
  });
}

// doesn't work properly, no idea why (
//doRequest(String url, String data) async {
//  final req = await HttpRequest.request(url, method: 'POST', mimeType: 'application/json', responseType: 'json', sendData: data);
//  final e = await req.onReadyStateChange.where((e) {
//    print(e);
//    req.readyState == HttpRequest.DONE;
//  }).first;
//  print('xxxx');
//  final resp = req.responseText;
//  print(resp);
}
