library structural_directive_custom_ng_for_with_template.app_element;

import 'package:angular2/angular2.dart' show Component, ControlGroup, FORM_DIRECTIVES, Input, NgFor, Output, View;

@Component(
    selector: 'app-element'
)
@View(
    template: '''
<h1>app-element</h1>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
}

@Component(
    selector: 'app-element'
)
@View(
    template: '''
<h1>app-element</h1>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  NgFor xfor;
}
