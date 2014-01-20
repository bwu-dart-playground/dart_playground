library x;

import 'dart:io';

void main(List<String> args) {
  new HttpClient().postUrl(Uri.parse("http://localhost:8080"))
    .then((HttpClientRequest req) => req.write("{'someJson': 'someJsonData'}"))
    .then((HttpClientResponse res) => res.listen((e) => print(e)));
}