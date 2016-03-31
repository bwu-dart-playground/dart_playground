library ng_content_get_html.app_element;

import 'package:angular2/angular2.dart'
    show
        AfterContentInit,
        Component,
        ControlGroup,
        ElementRef,
        FORM_DIRECTIVES,
        Input,
        Output,
        View;
import 'dart:html' show Element;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<parent-element>{{someContent}}</parent-element>
<button (click)="updateContent()">click</button>
''',
    directives: const [ParentElement])
class AppElement {
  String someContent = '-- some content --';

  updateContent() => someContent = "++ something else ++";
}

@Component(selector: 'parent-element',template: '''
<h1>parent-element</h1>
<ng-content></ng-content>
''')
class ParentElement implements AfterContentInit {
  ElementRef _elementRef;
  ParentElement(this._elementRef);

  ngAfterContentInit() {
    print('bla');
    print((_elementRef.nativeElement as Element).innerHtml);
  }
}
