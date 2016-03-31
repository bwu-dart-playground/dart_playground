library so34881401_style_body.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        DomAdapter,
        EventEmitter,
        FORM_DIRECTIVES,
        Injectable,
        Input,
        Output,
        View;
import 'package:angular2/platform/browser.dart';


@Component(selector: 'body', host: const {
  '[class.some-class]': 'someClass',
//  '[style.background-image]': 'bodyBackgroundImage()'
  '[style.background-color]': 'bodyBackgroundColor()'
},
    template: '''
<h1>app-element</h1>
<div> is logged-in: {{isLoggedIn}}</div>
<login-element></login-element>
''',
    directives: const [LoginElement])
class AppElement {
  bool someClass = false;
  LoginService _loginService;
  AppElement(this._loginService) {
    _loginService.isLoggedInChanged.listen((bool value) => isLoggedIn = value);
  }
  bool isLoggedIn = false;

//  String bodyBackgroundImage() =>
//      isLoggedIn ? 'url("../packages/so34881401_style_body/bg.jpg")' : 'none';

  String bodyBackgroundColor() => isLoggedIn ? 'blue' : '';
}

@Component(selector: 'login-element',
    styles: const [
      '''
body {
  border: 3px solid red;
}
'''
    ],
    template: '''
<h1>login-element</h1>
<button (click)="click()">toggle</button>
''')
class LoginElement {
  LoginService _loginService;
  DomAdapter _dom = new BrowserDomAdapter();
  LoginElement(this._loginService);
  void click() {
    _loginService.toggleLoggedIn();

    _loginService.isLoggedInChanged.listen((bool value) {
      int padding = 0;
      if (value) {
        padding = 50;
      }
      _dom.setStyle(_dom.query('body'), 'padding', '${padding}px');
    });
  }
}

@Injectable()
class LoginService {
  EventEmitter<bool> isLoggedInChanged = new EventEmitter<bool>();
  bool _isLoggedIn = false;
  void toggleLoggedIn() {
    _isLoggedIn = !_isLoggedIn;
    isLoggedInChanged.add(_isLoggedIn);
  }
}
