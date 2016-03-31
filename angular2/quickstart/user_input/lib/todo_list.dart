library user_input.todo_list;

import 'dart:html';
import 'package:angular2/angular2.dart';

@Component(selector: 'todo-list',
    // An alternative to using \$event is to use a raw string instead.
    // For example, change "template: '''" to "template: r'''".
//    template: '''
//    <ul>
//      <li *ng-for="#todo of todos">
//        {{ todo }}
//      </li>
//    </ul>
//    <input #todotext (keyup)="doneTyping(\$event)">
//    <button (click)="addTodo(todotext.value)">Add Todo</button>
//    <div>{{todotext.value}}</div>
//''',
templateUrl: 'todo_list.html'
,directives: const [NgFor]
)
class TodoList {
  List<String> todos = [
    'Eat breakfast',
    'Walk dog',
    'Breathe',
    'Learn Angular'
  ];

  @ViewChild('todotext')
  ElementRef input;

  void addTodo(String todo) {
    todos.add(todo);
    (input.nativeElement as InputElement).value = null;
  }

  void doneTyping(KeyboardEvent event) {
    if (event.keyCode == KeyCode.ENTER) {
      addTodo((input.nativeElement as InputElement).value);
    }
  }
}
