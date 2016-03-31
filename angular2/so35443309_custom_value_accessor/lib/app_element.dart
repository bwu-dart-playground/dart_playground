library so35443309_custom_value_accessor.app_element;

import 'package:angular2/core.dart' show Component, Directive,  Input, Output, View;
import 'package:angular2/src/common/forms/directives/number_value_accessor.dart' show NUMBER_VALUE_ACCESSOR, NumberValueAccessor;



@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<div>num:<input type="number" [(ngModel)]="numberValue"></div>
<div>result: {{numberValue}}</div>
'''
)
class AppElement {
  num numberValue;
}

//@Directive(
//  selector: 'input[type=num][num]'//,
////  host: {'(labelsChange)': 'onChange($event)'},
////  providers: [CUSTOM_VALUE_ACCESSOR]
//)
//class NumValueAccessor implements ControlValueAccessor {
//
//}
