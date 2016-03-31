library so34990102_output_bind_to_template.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        EventEmitter,
        FORM_DIRECTIVES,
        Input,
        Output,
        View;

@Component(selector: 'app-element',template: '''
<h1>app-element</h1>
<page-component></page-component>
''' ,
    directives: const [MyPageComponent]
    )
class AppElement {}

@Component(
    selector: 'myText',
    template: r'''
<label>{{someLabel}}</label>
<input id=myId type="text" [ngModel]=bindModelData (ngModelChange)="updateData($event)">
                 ''')
class MyTextComponent {
  String someLabel = "someLabelText";
  @Input()
  String myId;
  @Input()
  String bindModelData;
  @Output()
  EventEmitter bindModelDataChange = new EventEmitter();
  void updateData(String event) {
    this.bindModelData = event;
    this.bindModelDataChange.add(event);
  }
}

@Component(selector: 'page-component',
    template: r'''
<myText myId="id1" [(bindModelData)]="myString1"></myText><div>1: {{myString1}}</div>
<myText myId="id2" [(bindModelData)]="myString2"></myText><div>1: {{myString2}}</div>
              ''',
    directives: const [MyTextComponent])
class MyPageComponent {
  String myString1;
  String myString2;
}
