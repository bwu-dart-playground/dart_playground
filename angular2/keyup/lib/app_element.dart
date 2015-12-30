library keyup.app_element;

import 'dart:html' as dom;
import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
)
@View(
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  void keyUpHandler(dom.KeyboardEvent event) {
    print(event);
  }
}
