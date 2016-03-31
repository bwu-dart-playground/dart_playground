library so34808134_output_name.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        EventEmitter,
        FORM_DIRECTIVES,
        Input,
        OnInit,
        Output,
        View;

@Component(selector: 'app-element',
    template: r'''
<h1>app-element</h1>
<dev-table (complete)="onSelect($event)"></dev-table>
''',
    directives: const [FORM_DIRECTIVES, DevTableComponent])
class AppElement {
  onSelect(event) {
    print(event);
  }
}

@Component(
    selector: 'dev-table',
    template: '''
      <button
        (click)="onSelect()">click me
      </button>
  '''
//  providers: [DevService]
    )
class DevTableComponent {
  @Output() EventEmitter complete = new EventEmitter();
  onSelect() {
    complete.add(true);
  }
}
