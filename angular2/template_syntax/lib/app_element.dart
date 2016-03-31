library template_syntax.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ContentChildren,
        ControlGroup,
        Directive,
        FORM_DIRECTIVES,
        Input,
        Output,
        QueryList,
        View;

// https://github.com/angular/angular/issues/5894

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
    Demo:
    <bs-tabs>
      <div template='bsPane; title: exp'>
        summary text ...
      </div>
      <!-- <div *bsPane="title: 'Summary'">
        summary text ...
      </div> -->
    </bs-tabs>''',
    directives: const [BsTabs, BsPane])
class AppElement {}

@Directive(selector: '[bsPane]')
class BsPane {
  @Input()
  String title;
}

@Component(
    selector: 'tabs',
    template: '''
    <ul class="nav nav-tabs">
      <li *ngFor="var pane of panes"
          role="presentation" [class.active]="pane.active">
        <a href="javascript: false">{{pane.title}}</a>
      </li>
    </ul>''')
class BsTabs {
  @ContentChildren(BsPane)
  QueryList<BsPane> panes;
}
