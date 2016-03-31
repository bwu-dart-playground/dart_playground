library ng_do_check.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        DoCheck,
        FORM_DIRECTIVES,
        Input,
        IterableDiffer,
        IterableDiffers,
        OnChanges,
        Output,
        View;
import 'dart:async' show Timer;

/// from https://angular.io/docs/js/latest/api/core/DoCheck-interface.html

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
  <button (click)="list.add(list.length)">Add</button>
  <button (click)="list.removeLast()">RemoveLast</button>
  <custom-check [list]="list"></custom-check>
''',
    directives: const [CustomCheckComponent])
class AppElement implements DoCheck {
  List list = [];
  AppElement() {
    new Timer.periodic(const Duration(seconds: 1), (_) => list.add(list.length));
  }

  void ngDoCheck() {
  }
}

@Component(selector: 'custom-check',
    template: '''
    <div>value: {{value}}</div>

    <p>Changes:</p>
    <ul>
      <li *ngFor="#line of list">{{line}}</li>
    </ul>
    ''',
    directives: const [])
class CustomCheckComponent implements DoCheck {
  @Input() List list;
  IterableDiffer differ;
  List logs = [];

  int value = 0;

  CustomCheckComponent(IterableDiffers differs) {
    this.differ = differs.find([]).create(null);
    new Timer.periodic(const Duration(seconds: 1), (_) => value++);
  }

  void ngDoCheck() {
//    var changes = this.differ.diff(this.list);

//    if (changes != null) {
//      changes.forEachAddedItem((r) =>
//          this.logs.add('added ${r.item}'));
//      changes.forEachRemovedItem((r) =>
//          this.logs.add('removed ${r.item}'));
//    }
  }
}
