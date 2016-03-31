library template_ref.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement implements AfterViewInit {
  TemplateRef _templateRef;
  AppElement(this._templateRef);
  void ngAfterViewInit() {
    print(_templateRef);
  }
}
