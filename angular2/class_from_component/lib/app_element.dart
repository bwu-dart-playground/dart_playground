library class_from_component.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
)
@View(
    templateUrl: 'app_element.html' ,
    directives: const [SecondComponent]
)
class AppElement {

}

@Component(selector: 'second', template: '''
hello world - classes: {{classes}}
id: {{someId}}
''')

class SecondComponent {
//  @HostBinding('class.valid') bool valid = true;
  @Input('id') String someId;
  @Input('class') String classes;
}


// different topic
@Injectable()
class SomeService {
  DomAdapter dom;
  SomeService(this.dom) {
    dom.getGlobalEventTarget('window').addEventListener('message', function, false);
  }

  void function() {
  }
}
