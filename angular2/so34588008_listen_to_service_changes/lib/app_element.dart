library so34588008_listen_to_service_changes.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' ,
    directives: const [ChildElement1, ChildElement2]
)
class AppElement {
  Auth auth;
  AppElement(this.auth);
}

@Component(
    selector: 'child-element-1'
,
    template: 'child-element-1' //,
)
class ChildElement1 {
  Auth _auth;
  ChildElement1(this._auth) {
    _auth.authenticatedChanged.listen((e) =>
    print('child1: $e'));
  }
}

@Component(
    selector: 'child-element-2'
,
    template: 'child-element-2' //,
)
class ChildElement2 {
  Auth _auth;
  ChildElement2(this._auth) {
    _auth.authenticatedChanged.listen((e) =>
    print('child2: $e'));
  }
}


@Injectable()
class Auth {
  @Output() EventEmitter<bool> authenticatedChanged = new EventEmitter<bool>();
  bool authenticated = false;
  void login() {
    authenticatedChanged.add(true);
  }
}
