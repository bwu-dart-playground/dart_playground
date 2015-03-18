import 'dart:io';
import 'dart:async';
import 'dart:convert';

Future<Map> ft_get_data() {
  File data;
  Future data_result;

  data = new File("data.json");
  return data.exists().then((value) {
    if (!value) {
      print("Data does no exist...\nCreating file...");
      data.createSync();
      print("Filling it...");
      data.openWrite().write('{"index":{"content":"Helllo"}}');
      print("Operation finish");
    }
    return (1);
  }).then((value) {
    data_result = data.readAsString().catchError((e) {
      print("error");
      return (new Map());
    });
    data_result.then((content) {
      return JSON.decode(content);
    }).catchError((e) {
      print("error");
      return (new Map());
    });
  });
}

void main() {
  Map data_map;

  HttpServer.bind('127.0.0.1', 8080).then((server) {
    print("Server is lauching... $server");
    server.listen((HttpRequest request) {
      request.response.statusCode = HttpStatus.ACCEPTED;
      ft_get_data().then((data_map) {
        if (data_map && data_map.isNotEmpty) request.response.write(
            data_map['index']['content']); else request.response.write('Not work');
        request.response.close();
      });
    });
  }).catchError((error) {
    print("An error : $error.");
  });
}
