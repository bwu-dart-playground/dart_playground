library so35212475_change_toggle_required_update_validation.app_element;

import 'package:angular2/core.dart'
    show
        AfterViewInit,
        Component,
        ControlGroup,
        FORM_DIRECTIVES,
        Input,
        Output,
        View,
        ViewChild;
import 'dart:html' show window, InputElement;

@Component(selector: 'app-element',template: '''
<h1>app-element</h1>
   <div>
    <form #f="ngForm">
      <button type="button" (click)="toggleReadOnly()">Change readonly!</button>
      <button type="button" (click)="toggleRequired()">Change required!</button>
      <input id="field" [(ngModel)]="field"
          [required]="isRequired ? true : null"
          [readonly]="isReadOnly ? true : null"
          [ngControl]="fieldCtrl" #fieldCtrl="ngForm" #input>
      <div>valid: {{fieldCtrl.valid}}, required: {{isRequired}}</div>
    </form>
    </div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement implements AfterViewInit {
  String name = 'Angular2';
  bool isReadOnly = false;
  String field = "feel free to edit";
  bool isRequired = false;

//  @ViewChild('input')
//  dynamic input = '';

  void ngAfterViewInit() {
//    print(input);
  }

  void toggleRequired() {
//    print(input);
    isRequired = !isRequired;
    //var fieldElement = <InputElement> input.nativeElement;
    InputElement fieldElement =
        (window.document.getElementById('field') as InputElement);
    if (isRequired) {
      fieldElement.required = true;
      //field = "it's required now";
    } else {
      fieldElement.required = false;
      //field = "can leave it blank";
    }
    //field.updateValueAndValidate(field);
  }

  void toggleReadOnly() {
    isReadOnly = !isReadOnly;
    InputElement fieldElement =
        (window.document.getElementById('field') as InputElement);
    if (isReadOnly) {
      fieldElement.readOnly = true;
      // field = "it's readonly now";
    } else {
      fieldElement.readOnly = false;
      // field = "feel free to edit";
    }
  }
}
