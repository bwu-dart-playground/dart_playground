library x;

import 'dart:io';
import 'dart:async';
import 'dart:convert';
//import 'package:route/server.dart';

Future<bool> addCorsHeaders(HttpRequest request) {
  print('addCorsHeader');
  return new Future.value(true);
}

Future<bool> authenticate(HttpRequest request) {
  print('authenticate');
  return new Future.value(true);
}

void userGetHandler(HttpRequest request) {
  print('userGetHandler');
}

void userPostHandler(HttpRequest request) {
  print('userPostHandler');
  print('userPostHandler isBroadcast: ${request.isBroadcast}');
  request.listen((e) {
    request.headers.value(HttpHeaders.ACCEPT_LANGUAGE);
    print('userPostHandler: ${new String.fromCharCodes(e)}');
    request.response.write(new String.fromCharCodes(e));
    request.response.close();
  });
  //request.asBroadcastStream()
}

Future<bool> logRequest(HttpRequest req) {
  Future<bool> result = new Future<bool>(() {
    print("log request path: ${req.uri.path}");
    print('logRequest isBroadcast: ${req.isBroadcast}');
    StreamSubscription x = req.listen((e) {
      print('logRequest: ${new String.fromCharCodes(e)}');
    });
    return true;
  });
  return result;
}

void main(List<String> args) {
  String userGetURL = '/';
  String userPostURL = '/';

  HttpServer.bind("127.0.0.1", 8089).then((server) {
    server.listen((HttpRequest request) async {
      if(request.headers.contentType == 'xx') {
      Map result =
          await request.transform(UTF8.decoder).join().then(JSON.decode);
      print(result);
      }
    });
//    var x = server.asBroadcastStream();
//    print('server: ${x.isBroadcast}');
//    new Router(x)
//    ..filter(new RegExp(r'/.*'), addCorsHeaders)
//    ..filter(new RegExp(r'/admin/.*'), authenticate)
//    ..filter(new RegExp('/(.*)'), logRequest)
//    ..serve(userGetURL, method: 'GET').listen(userGetHandler)
//    ..serve(userPostURL, method: 'POST').listen(userPostHandler);
    //..defaultStream.listen(send404);
  });

  final client = new HttpClient()
      .postUrl(Uri.parse("http://127.0.0.1:8089"))
      .then((HttpClientRequest req) {
    req.write('{"someJson": "someJsonData"}');
    return req.close();
  }).then((HttpClientResponse res) {
    print('response: ${res}');
    res.listen((e) => print('client received: ${new String.fromCharCodes(e)}'));
  }).then((_) {
    final client = new HttpClient()
        .postUrl(Uri.parse("http://127.0.0.1:8089"))
        .then((HttpClientRequest req) {
      req.write('{"someJson": "someJsonData"}');
      return req.close();
    }).then((HttpClientResponse res) {
      print('response: ${res}');
      res.listen((e) => print('client received: ${new String.fromCharCodes(e)}'));
    });

  });
}
