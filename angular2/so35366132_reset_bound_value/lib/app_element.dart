library so35366132_reset_bound_value.app_element;

import 'package:angular2/core.dart'
    show
        ApplicationRef,
        ChangeDetectorRef,
        Component,
        ControlGroup,
        FORM_DIRECTIVES,
        Input,
        Output,
        View;

class Todo {
  String title;
  Todo(this.title);
}

@Component(
    selector: 'subcomp',
    //directives: [FORM_DIRECTIVES],
    template:
        '''
New Title: <input type="text" [ngModel]="subtodo.title">
        ''')
class Subcomp {
  @Input()
  Todo subtodo;
}

@Component(
    selector: 'app-element',
    directives: const [Subcomp],
    template: '''
<h1>app-element</h1>
To do: {{todo.title}}<br/>
<subcomp [subtodo]="todo"></subcomp><br/>
<button (click)="update()">Update</button>''')
class AppElement {
  ApplicationRef _appRef;
//  ChangeDetectorRef _changeDetectionRef;
  AppElement(/*this._appRef, this._changeDetectionRef*/);

  Todo todo = new Todo('start');
//  String someText = 'start';

  void update() {
    //todo.title = 'yyy';
//    todo.title = 'stop';
//    someText = 'changed';
    todo = new Todo('startx' + new DateTime.now().toString());
//    _appRef.tick();
//    _changeDetectionRef.detectChanges();
  }
}
