import 'package:http/http.dart' as http;
import 'dart:io';

main() {
  SecureSocket.initialize()
  var cl = new HttpClient();
  cl.badCertificateCallback = () => print(x);

  var client = new http.Client();
  client.
  client.post('https://intra.42.fr/?format=json', body: {"login": "test", "password": "test"})
    .then((response) => print(response.body)
    );
}