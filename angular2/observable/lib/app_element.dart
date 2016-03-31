library observable.app_element;

import 'package:angular2/angular2.dart' show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;
import 'package:observe/observe.dart' show toObservable, ObservableList;
import 'dart:async' show Timer;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<div *ngFor="#val of values; #i=index">value: {{val}}</div>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  // ObservableList<int> values = toObservable(<int>[1, 2, 3]) as ObservableList<int>;
  // Observable is usually not necessary
  List<int> values = [1, 2, 3];
  Timer _timer;
  AppElement() {
    _timer = new Timer.periodic(const Duration(seconds: 1), (_) => values.add(values.length));
  }
}
