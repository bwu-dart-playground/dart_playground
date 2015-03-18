import 'dart:io';
import 'dart:async';
import 'dart:convert';

Future<Map> ft_get_data() {
  File data;

  data = new File("data.json");
  return data.exists().then((value) {
    if (!value) {
      print("Data does no exist...\nCreating file...");
      data.createSync();
      print("Filling it...");
      data.openWrite().write('{"index":{"content":"Helllo"}}');
      print("Operation finish");
    }
  }).then((_) => data.readAsString()).then((content) => JSON.decode(content)
      ).catchError((e) => new Map());
}

void main() {
  Map params;
  String name;
  num check = 0;

  HttpServer.bind('127.0.0.1', 8089).then((server) {
    print("Server is lauching... $server");
    server.listen((HttpRequest request) {
      print(request.requestedUri);
      request.response.statusCode = HttpStatus.ACCEPTED;
      //request.response.headers.contentType = new ContentType('text', 'htm    l');
      //params = request.uri.queryParameters; // http://127.0.0.1:8080/?name=tristan
      ft_get_data().then((data_map) {
        name = data_map['index']['content'];
        print('check: $check');
        if (data_map.isNotEmpty) request.response.write(name); else
            request.response.write('Booh');
        check++;
      }).whenComplete(request.response.close);
    });
  }).catchError((error) {
    print("An error : $error.");
  });
}
