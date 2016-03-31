library so34907719_paper_heading.app_element;

import 'package:angular2/angular2.dart' show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;
import 'package:polymer_elements/paper_card.dart';

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<paper-card [heading]="someVarFromComponent"></paper-card>
''' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  String someVarFromComponent = 'someVar';
}
