import 'dart:io';

void main(args) {
  print('main');
  new HttpClient().getUrl(Uri.parse('http://127.0.0.1:8089'))
  .then((HttpClientRequest r) {
    r.close().then((HttpClientResponse r) {

      r.listen((List<int> data) {
        print(new String.fromCharCodes(data));
      });
    });
  });
//  .then((List<int> r) {
//    print('data2: $r');
//  });
//  new HttpClient().get('127.0.0.1', 8088, '/').then((HttpClientRequest r) {
//    print('then');
//    r.write('');
//    r.done.then((HttpClientResponse r) {
//      r.listen((List<int> data) {
//        print(data);
//      });
//      print(r.toString());
//    });
//    r.done.whenComplete(() {
//      print('complete');
//    });
//
//  }).then((HttpClientResponse r) {
//    r.listen((List<int> data) {
//      print(data);
//    });
//  }).whenComplete(() {
//    print('action');
//  });
}