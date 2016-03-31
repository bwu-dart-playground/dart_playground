library on_click_bind.app_element;

import 'package:angular2/angular2.dart' show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<!-- <button onClick="onSave()">save</button> -->
<div [ngClass]="{bad:false, curly:true, special:true}">Curly special</div>
<img src="{{iconUrl}}"/>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  String iconUrl = 'xxx';
  onSave([dynamic event]) {
    print('save clicked');
  }
}
