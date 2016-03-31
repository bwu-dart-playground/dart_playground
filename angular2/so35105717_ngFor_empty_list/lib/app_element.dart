library so35105717_ngFor_empty_list.app_element;

import 'package:angular2/angular2.dart' show Component, ControlGroup, FORM_DIRECTIVES, Injectable, Input, Output, View;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<ul>
  <li *ngFor="#todo of todoService.todos">
    {{todo}}
  <li>
</ul>
---
<ul>
  <template ngFor #todo [ngForOf]="todoService.todos">
    <li>
      {{todo}}
    <li>
  </template>
</ul>

''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  TodoService todoService;
  AppElement(this.todoService);
}

@Injectable()
class TodoService {
    List todos = ['xxx'];
}
