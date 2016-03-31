library issue6504_controlgroup_errors_null.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        FORM_DIRECTIVES,
        FormBuilder,
        Input,
        Validators,
        View;

@Component(selector: 'app-element',
    styles: const [
      '''
.has-error input {
  border: 1px solid red;
}
'''
    ],
    template: '''
<form [ngFormModel]="myForm" (ngSubmit)="submitListing(myForm)">
  <input type="text"
      [ngFormControl]="myForm.controls['someInput']"
      [(ngModel)]="someInputModel">
  <div>someInput errors: {{myForm.controls['someInput'].errors}}, valid: {{myForm.controls['someInput'].valid}}</div>
  <div>myForm errors: {{myForm.errors}}, valid: {{myForm.valid}}</div>
</form>
''',
    directives: const [FORM_DIRECTIVES])
class AppElement {
  ControlGroup myForm;
  String someInputModel = '';

  AppElement(FormBuilder fb) {
    myForm = fb.group({
      'someInput': [
        '',
        Validators.compose([
          Validators.required,
          Validators.minLength(2),
          Validators.maxLength(10)
        ])
      ],
    });
  }

  void submitListing(ControlGroup value) {
    print("Form Submited");
  }
}
