library inject_parent_component.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element', directives: const [ChildElement],templateUrl: 'app_element.html')
class AppElement {
  @ViewChild('child') ChildElement childElement;
  AppElement();
}

@Component(selector: 'child-element',template: 'child_element' //,
//    directives: const [FORM_DIRECTIVES]
    )
class ChildElement implements OnInit {
  AppElement _appElement;
  ChildElement(this._appElement);

  ngOnInit() {
    print(_appElement);
  }
}
