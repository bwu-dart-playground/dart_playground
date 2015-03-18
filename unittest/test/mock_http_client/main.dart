import 'package:http/http.dart' as http;
import 'package:mock/mock.dart';
import 'package:unittest/unittest.dart';

class SampleClass {
  String _arg1;
  String _arg2;
  http.Client _httpClient;

  SampleClass(String arg1, String arg2, [http.Client httpClient = null]) {
    this._arg1 = arg1;
    this._arg2 = arg2;
    _httpClient = (httpClient == null) ? http.Request : httpClient;
  }
}

class HttpClientMock extends Mock implements http.Client {
  noSuchMethod(i) => super.noSuchMethod(i);
}


void main() {
  test('bla', () {
    var mockHttpClient = new HttpClientMock()
            ..when(callsTo('send')).alwaysReturn("this is a test");

    http.Request req = new http.Request('POST', Uri.parse('http://www.google.com'));
    var s = mockHttpClient.send(req);
    print(s);
    expect(mockHttpClient.send(req), equals('this is a test'));

  });
}