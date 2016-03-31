library so35011393_pipe_access_component.app_element;

import 'package:angular2/angular2.dart' show Component, ControlGroup, FORM_DIRECTIVES, Input, Output, Pipe, PipeTransform, View;
import 'dart:async' show Timer;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<div *ngFor="#item of items | filter: [items, other]">{{item}}</div>
<div>other: {{other}}</div>
''' ,
    pipes: const [SearchPipe]
)
class AppElement {
  List<String> items = ['Apple', 'Orange', 'Kiwi'];
  String other = 'other';
  int _pos = 0;
  AppElement() {
    new Timer.periodic(const Duration(seconds: 1), (_) => other = items[_pos++ % 3]);
  }
}

@Pipe(name: 'filter')
class SearchPipe extends PipeTransform {
  void transform(dynamic value, List args) {
    print(args[0]);

  }
}
