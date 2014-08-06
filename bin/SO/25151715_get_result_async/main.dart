import 'dart:io';
import 'package:sqljocky/sqljocky.dart';

final connection = new ConnectionPool(host: 'localhost', port: 3306, user: 'root', password: r'Mrp192000==', db: 'test');

main() {
  HttpServer.bind(InternetAddress.ANY_IP_V4, 9090)..then((server) {
    print("serving generic database query on localhost:9090");
    server.listen((request) {
      if (request.method == "GET") {
        getResults()
        .then((result) {
          print('Result: $result');
          request.response.write(result);
          request.response.close();
        });
      }
      else {
        request.response.statusCode = HttpStatus.BAD_REQUEST;
      }
    });
  });
}

Future<String> getResults() {

  StringBuffer sb = new StringBuffer();
  sb.write("START--");
  return connection.query("select ID, NAME FROM test_table")
  .then((Result results) => results.toList())
  .then((list) {
    list.forEach((row) {
      sb.write(row.toString());
    });
    sb.write("--END");
  })
  .then((_) => sb.toString());
}
