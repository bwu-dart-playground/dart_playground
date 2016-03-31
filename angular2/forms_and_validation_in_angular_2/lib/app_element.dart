library forms_and_validation_in_angular_2.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        Control,
        ControlGroup,
        FORM_DIRECTIVES,
        FormBuilder,
        Input,
        NgControl,
        NgControlGroup,
        Output,
        View,
        Validators;
import 'dart:convert' show JSON;

/// http://www.syntaxsuccess.com/viewarticle/forms-and-validation-in-angular-2.0

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>

<form-element></form-element>
''',
    directives: const [FORM_DIRECTIVES, FormElement])
class AppElement {
  ControlGroup form;
  AppElement(FormBuilder fb) {
    form = fb.group({
      "firstName": ['xxx__', Validators.required],
      "streetAddress": ['yyy__', Validators.required],
      "zip": [
        '12345',
        Validators.compose([ZipValidator.validate])
      ],
      "type": ['home']
    });
    print('x');
  }
}

class ZipValidator {
  static Map<String, bool> validate(Control zip) {
    print('zipValidator.validate');
    bool valid = new RegExp(r'^\d{5}$').hasMatch(zip.value);
    if (valid) {
      return null;
    }
    return {"invalidZip": true};
  }
}

@Component(selector: 'form-element',template: '''
<h1>form-element</h1>
<form (ngSubmit)="onSubmit()" [ngFormModel]="form" #f="ngForm">
    <div>
        <div class="formHeading">First Name</div>
        <input type="text" id="firstName" ngControl="firstName">
        <div class="errorMessage" *ngIf="f.form.controls['firstName'].touched && !f.form.controls['firstName'].valid">First Name is required</div>
    </div>
    <div>
        <div class="formHeading">Street Address</div>
        <input type="text" id="streetAddress" ngControl="streetAddress">
        <div class="errorMessage" *ngIf="f.form.controls['streetAddress'].touched && !f.form.controls['streetAddress'].valid">Street Address is required</div>
    </div>
    <div>
        <div class="formHeading">Zip Code</div>
        <input type="text" id="zip" ngControl="zip" #zip>  x: {{zip.value}}
        <div class="errorMessage" *ngIf="f.form.controls['zip'].touched && !f.form.controls['zip'].valid">Zip code has to be 5 digits long</div>
    </div>
    <div>
        <div class="formHeading">Address Type</div>
        <select id="type" ngControl="type">
            <option [value]="'home'">Home Address</option>
            <option [value]="'billing'">Billing Address</option>
        </select>
    </div>
    <button type="submit" [disabled]="!f.form.valid">Save</button>
    <div>
        <div>The form contains the following values</div>
        <div>
            {{payLoad}}
        </div>
    </div>
</form>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class FormElement {
  ControlGroup form;
  String payLoad;
  FormElement(FormBuilder fb) {
    form = fb.group({
      "firstName": ['', Validators.required], // first list item is the initial value for the control
      "streetAddress": ['', Validators.required],
      "zip": [
        '',
        /*Validators.compose([*/ZipValidator.validate/*])*/
      ],
      "type": ['home']
    });
    print('x');
  }

  void onSubmit() {
    payLoad = JSON.encode(this.form.value);
  }
}
