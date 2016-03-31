library _template.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<div>value: {{someValue}}</div>
<button (click)="someValue+=someValue+1">click</button>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  int someValue = 0;
}
