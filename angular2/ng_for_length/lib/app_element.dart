library ng_for_length.app_element;

import 'package:angular2/angular2.dart'
    show
        AfterViewInit,
        Component,
        ControlGroup,
        ElementRef,
        FORM_DIRECTIVES,
        Input,
        Output,
        QueryList,
        View,
        ViewChildren;
import 'dart:html' show Element, KeyboardEvent;

// see also http://plnkr.co/edit/NVEBYAWCH7ybCy5pqaBr?p=preview
@Component(selector: 'app-element',
    template: r'''
<h1>app-element</h1>
<div>
  <div><input #input (keydown)="add($event)" *ngFor="#input of inputs"><div>
  <div>length: {{inputs?.length}}</div>
</div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement implements AfterViewInit {
  List<String> inputs = ['1'];
  @ViewChildren('input') QueryList vc;

  int length;

  ngAfterViewInit() {
    this.vc.changes.listen((d) {
      ((d.last as ElementRef).nativeElement as Element).focus();
      length = d.length;
    });
  }

  add(KeyboardEvent key) {
    if (key.which == 13) {
      this.inputs.add('${inputs.length+1}');
    }
  }
}
