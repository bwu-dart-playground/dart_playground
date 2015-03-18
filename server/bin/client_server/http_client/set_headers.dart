
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main(args) {
  getDbStats().then((e) => print('xxx: ${e}'));
}

Future<dynamic> getDbStats() {
  String url  = "https://api.mongolab.com/api/1/databases/amusement_parks/dbStats?apiKey=qZGpZGMER4fdHFxNupVVlplvUHLFL2JH";
  return new http.Client()
    .post(url, headers: {'Content-type': 'application/json'},
        body: JSON.encoder.convert({"distinct": "users","key": "account","query": {"active":true}}))
        .then((http.Response r) => r.body)
        .whenComplete(() => print('completed'));
}

void _set_dbStats(dynamic event) {
  print(event);
}
