library router_current_route.app_element;

import 'package:angular2/angular2.dart'
    show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;
import 'package:angular2/router.dart' show Router;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {

  /// incomplete, just copied the code how to get instruction
  Router _router;
  AppElement(this._router) {
    _router.subscribe(print);
    _router.subscribe((url) {
      // Current URL
      _router.recognize(url).then((instruction) {
        print(instruction); // Current instruction
      });
    });
  }
}
