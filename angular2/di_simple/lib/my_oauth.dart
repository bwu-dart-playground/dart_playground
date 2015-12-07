library di_simple.my_oauth;

import 'package:angular2/core.dart' show Injectable, Observable;
import 'package:di_simple/my_http.dart';

@Injectable()
class MyOAuth extends MyHttp {
  MyOAuth() : super();

  String request(String url) {
    print('request: ${url}');
    return 'request done';
  }
}
