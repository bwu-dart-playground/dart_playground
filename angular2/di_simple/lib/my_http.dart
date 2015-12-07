library di_simple.my_http;

import 'package:angular2/angular2.dart';

@Injectable()
abstract class MyHttp {
  MyHttp();

  String request(String url);
}
