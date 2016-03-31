library bug_checkbox_old_value.app_element;

import 'package:angular2/angular2.dart'
    show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;
import 'dart:html' show Event, CheckboxInputElement;

@Component(selector: 'app-element',
    template: r'''
<div>
  <h2>Hello {{name}}</h2>
  <input type="checkbox" [(ngModel)]="model" (change)="logModel($event)">
  {{ model }}
</div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {
  String name = 'Angular2';
  bool model = false;
  void logModel(Event inModel) {
    ;
    print((inModel.target as CheckboxInputElement).checked);
    print(this.model);
  }
}
