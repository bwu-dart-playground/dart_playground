import "dart:io";
import 'dart:convert' show UTF8;

// client, pass the url as parameter:
// dart client.dart http://localhost:8192
void main(List<String> args) {
  HttpClient client = new HttpClient();
  client.getUrl(
      Uri.parse('http://[::1]:33333')).then((HttpClientRequest request) {
    return request.close();
  }).then((HttpClientResponse response) {
    // Process the response.
    response.transform(UTF8.decoder).listen((contents) {
      print(contents.toString());
    }, onDone: () => client.close());
  });
}
