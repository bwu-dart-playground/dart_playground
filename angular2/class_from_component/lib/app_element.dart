library class_from_component.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Inject, Injectable, PLATFORM_INITIALIZER;
import 'package:angular2/platform/common_dom.dart' show DOM;
//import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;

@Component(selector: 'app-element',templateUrl: 'app_element.html', directives: const [SecondComponent])
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
  dynamic initializer;
  SomeService() {
    DOM
        .getGlobalEventTarget('window')
        .addEventListener('message', function, false);
  }

  void function() {}
}
