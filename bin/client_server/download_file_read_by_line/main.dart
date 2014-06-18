import 'dart:convert';
import 'dart:io';
import 'dart:async';

void main() {
  new HttpClient().getUrl(Uri.parse('http://www.gutenberg.org/files/45776/45776-h/45776-h.htm'))
    .then((r) => r.close()).then((HttpClientResponse response) {
      response.transform(UTF8.decoder).transform(new LineSplitter()).listen((e) => print('====${e}===='));
  });
}

//handleResponse(HttpClientResponse response) {
//
//  LineSplitter ls = new LineSplitter();
//  ls.bind(UTF8.decoder.bind(response)).listen((e)=> print('=====${e}====='));
//}
