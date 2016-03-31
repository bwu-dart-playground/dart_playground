library outside_dom_access.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement implements OnInit {

  @override
  void ngOnInit() {
    DOM.addClass(DOM.query("body"), 'fixed');
  }
}
