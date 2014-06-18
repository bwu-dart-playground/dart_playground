import 'package:http/http.dart' as http;
import 'dart:io';
void main() {
  var url = "http://httpbin.org/post";
  var client = new http.Client();
  var request = new http.Request('POST', Uri.parse(url));
  var body = {'content':'this is a test', 'email':'john@doe.com', 'number':'441276300056'};
//  request.headers[HttpHeaders.CONTENT_TYPE] = 'application/json; charset=utf-8';
  request.headers[HttpHeaders.AUTHORIZATION] = 'Basic 021215421fbe4b0d27f:e74b71bbce';
  request.bodyFields = body;
  var future = client.send(request).then((response)
      => response.stream.bytesToString().then((value)
          => print(value.toString()))).catchError((error) => print(error.toString()));
}