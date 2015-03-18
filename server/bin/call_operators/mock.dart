library x;

import 'package:http/http.dart' as http;
import 'package:mock/mock.dart';

typedef Handler(http.Request request);

abstract class HandlerClass {
  call(http.Request request);
}

@proxy
class MockHandler extends Mock implements HandlerClass {
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
  call(http.Request request){}
}

void doSomething(Handler h) {
  h(new http.Request('get', Uri.parse('')));
}

void main(args) {
  doSomething(new MockHandler());
}
