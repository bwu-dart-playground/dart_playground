library x;

import 'dart:io';
import 'package:http/http.dart' as http;

void main(List<String> args) {
  var client = new HttpClient();
  //  client.getUrl(Uri.parse('https://www.google.com')).then((HttpClientRequest r)
  //      {
  //
  //  });
  var c = new http.Client();
  c.get(Uri.parse('https://www.google.com')); //.then((http.Response r) {
  c.readBytes(Uri.parse('https://www.google.com')).then((List<int> data) {
    print(data);
  });



  //client.addCredentials(url, realm, credentials)
  //new HttpClient().getUrl(Uri.parse('https://www.somedomain.com'));


}
