library body_as_app_element_with_host_binding.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'body'
,
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  @HostBinding('class.fixed') bool isValid = true;
}
