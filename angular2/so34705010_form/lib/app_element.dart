library so34705010_form.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element')
@View(template: '<form-test></form-test>', directives: const [FormTest1])
class AppElement {}

@Component(
    selector: 'form-test',
    directives: const [FormInput, FORM_DIRECTIVES],
    template: '''
<form [ngFormModel]="heroForm">
    <br>Is Form Valid? - {{heroForm.valid}}<br>
    <br>Data: - {{input | json}}<br>
    <input type="text" [(ngModel)]="input['test1']" required [ngFormControl]="heroForm.controls['test1']">
    <form-input [hForm]="heroForm" [data]="input">
    </form-input>
    <button type="submit">Submit</button>
</form>
''')
class FormTest1 {
  ControlGroup heroForm;

  FormBuilder _builder;
  FormTest1(this._builder) {
    heroForm = _builder.group({
      'test1': ['', Validators.required],
      'test2': ['', Validators.required]
    });
  }
  Map input = {'test1': '', 'test2': ''};
}

@Component(
    selector: 'form-input',
    directives: const [FORM_DIRECTIVES, NgForm],
    template: '''
<label>sdsd</label>
<input type="text" [(ngModel)]="data['test2']" [ngFormControl]="hForm.controls['test2']" required>
''')
class FormInput {
  @Input() ControlGroup hForm;
  @Input() Map data;
}
