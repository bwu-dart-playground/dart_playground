library template_variable.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  @HostListener('click', const[r'$event'])
  void onClick(e) {
    print(e);
  }
}
