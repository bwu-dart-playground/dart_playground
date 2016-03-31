library so34561951_on_changes.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<button (click)="doSomething()">Do something</button>
<child-component [message]="message"></child-component>
    ''',
    directives: const [ChildComponent])
class AppElement {
  @Input()
  String message;
  @Output()
  EventEmitter messageChange = new EventEmitter();

  int i = 0;
  void doSomething() {
    // I want ngOnChanges to be called some time after I set the
    // message. Currently it is only called if the host element
    // changes the value of [message] on the element.
    message = 'some important stuff ${i++}';
    messageChange.add(message);
  }
}

@Component(selector: 'child-component',template: '''
<h1>child</h1>
<div>value: {{message}}
    ''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class ChildComponent implements OnChanges {
  @Input()
  String message;

  void ngOnChanges(Map<String, SimpleChange> changeRecord) {
    for (String key in changeRecord.keys) {
      print('changed: $key - ${changeRecord[key].currentValue}');
    }
  }
}
