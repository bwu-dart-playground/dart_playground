library class_from_component.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element')
@View(templateUrl: 'app_element.html', directives: const [SecondComponent])
class AppElement {
  SomeService _someService;
  AppElement(this._someService);
}

@Component(
    selector: 'second',
    template: '''
hello world - classes: {{classes}}
id: {{someId}}
''')
class SecondComponent {
  // set class
//  @HostBinding('class.valid') bool valid = true;
// read id
  @Input('id')
  String someId;
  // read all classes
  @Input('class')
  String classes;
}

// different topic
@Injectable()
class SomeService {
  DomAdapter dom;
  SomeService(this.dom) {
    dom
        .getGlobalEventTarget('window')
        .addEventListener('message', function, false);
  }

  void function() {}
}
