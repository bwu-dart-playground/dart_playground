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
  }).then((_) =>
      data.readAsString())
      .then((content) =>
          JSON.decode(content)
      ).catchError(
          (e) => new Map());
}

void main() {
  HttpServer.bind('127.0.0.1', 8088).then((server) {
    print("Server is lauching... $server");
    server.listen((HttpRequest request) {
      print('client request');
      request.response.statusCode = HttpStatus.ACCEPTED;
      ft_get_data().then((data_map) {
        print('data_map: $data_map');
        if (data_map.isNotEmpty) request.response.write(
            data_map['index']['content']); else request.response.write('Not work');
      }).whenComplete(request.response.close);
    });
  }).catchError((error) {
    print("An error : $error.");
  });
}
