library so34561951_on_changes.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
)
@View(
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement implements OnChanges{
  @Input() String message;
  @Output() EventEmitter messageChange = new EventEmitter();

  ngOnChanges(changeRecord) {
     for (var change in changeRecord) {
        print('changed: ' + change);
     }
  }

  doSomething() {
    // I want ngOnChanges to be called some time after I set the
    // message. Currently it is only called if the host element
    // changes the value of [message] on the element.
    messageChange.add('some important stuff');
  }
}
