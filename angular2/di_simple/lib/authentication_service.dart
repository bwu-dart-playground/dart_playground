library di_simple.authentication_service;

import 'package:angular2/angular2.dart';
import 'package:di_simple/my_oauth.dart';

@Injectable()
class AuthenticationService {
  MyOAuth oAuth;

  AuthenticationService(this.oAuth);

  String request(String url) => oAuth.request(url);
}
