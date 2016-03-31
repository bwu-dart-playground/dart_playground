library so34789250_validating_forms.app_element;

import 'package:angular2/angular2.dart'
    show AbstractControl, Component, Control, ControlArray, ControlGroup, FORM_DIRECTIVES, FormBuilder, Input, NgForm, NgFormModel, Output, Validators, View;
import 'dart:math';

@Component(selector: 'app-element',
    styles: const ['''
.has-error input {
  border: 1px solid red;
}
'''],
    template: r'''
<h1>app-element</h1>
<form [ngFormModel]="newListingForm" (ngSubmit)="submitListing(newListingForm)" (changes)="unSubmit($event)">

   <div class="form-group form-group-sm"
       [ngClass]="{'has-error':!newListingForm.controls['mainTitleInput'].valid}">
     <label for="for"
         class="col-sm-3 control-label">Name:</label>
       <div class="col-sm-8">
         <input type="text" placeholder="New Title" id="main-title_input" class="transparent"
             [ngFormControl]="newListingForm.controls['mainTitleInput']"
             [(ngModel)]="newListing.mainTitleInput">
             <div>errors: {{newListingForm.controls['errors']}}, valid: {{newListingForm.controls['mainTitleInput'].valid}}</div>
             <div>x {{!newListingForm.controls['mainTitleInput'].valid}}</div>
         <span *ngIf="!newListingForm.controls['mainTitleInput'].valid && isFormSubmitted"
             class="help-block text-danger">error
           <span *ngIf="newListingForm.controls['errors'] != null ? newListingForm.controls['errors'].required : false">
             The field is required
           </span>
         </span>
         <div>y</div>
<!--
  <input type="radio" #typeRadio="ngForm" [ngFormControl]="newListingForm.controls['typeRadio']" value="Event" id="type-event_radio" required>
  <input type="radio" #typeRadio="ngForm" [ngFormControl]="newListingForm.controls['typeRadio']" value="Venue" id="type-venue_radio" required>
  <input type="email" #emailAddressInput="ngForm" [ngFormControl]="newListingForm.controls['emailAddressInput']" id="email-address_input" required>
    -->
<!-- etc -->
    </div>
  </div>
  <div>form - valid: {{newListingForm.valid}}</div>
</form>
<button (click)="updateValue()">update</button>
''',
    directives: const [FORM_DIRECTIVES])
class AppElement {
  //Helpers
  NgForm form;
  NgFormModel formModel;
  ControlGroup newListingForm;
  NewListing newListing = new NewListing();
  ControlArray arr;
  //Costructor
  AppElement(FormBuilder fb) {
    newListingForm = fb.group({
//      'typeRadio': ['',  Validators.compose([Validators.required, Validators.minLength(2), Validators.maxLength(40)])],
      'mainTitleInput': [
        '',
        Validators.compose([
          Validators.required,
          CityValidator.validate,
          Validators.minLength(2),
          Validators.maxLength(40)
        ])
      ],
//      'emailAddressInput': ['', Validators.compose([Validators.required, Validators.minLength(2), Validators.maxLength(40)])],
    });
    arr = fb.array([newListingForm.controls['mainTitleInput']], ArrayErrorCollector.validate);
    newListingForm.statusChanges.listen((dynamic status) {
      print(status);
    });
  }

  void unSubmit() {
    isFormSubmitted = false;
  }
  bool isFormSubmitted = false;
  //TODO Form submission
  void submitListing(ControlGroup value) {
    isFormSubmitted = true;
    print("Form Submited");
  }

  void updateValue() {
    Random rnd = new Random();

    // direct control access
//    this.newListingForm.controls['mainTitleInput'].value
//                                      = rnd.nextInt(100).toString();
    newListing.mainTitleInput = rnd.nextInt(100).toString();
  }
}

class CityValidator {
  static Map<String, bool> validate(Control control) {
    List<String> validValues = ['Linz', 'Pregarten', 'Wien'];

    int cnt = validValues.where((String item) => item == control.value).length;

    return (cnt == 0) ? {'city': true} : null;
  }
}

class ArrayErrorCollector {
  static Map validate(AbstractControl control) {
    Map result = {};
    return result;
//    result.addAll(control.errors);
//    if(control is ControlGroup) {
//      control.controls.forEach((String name, AbstractControl control) {
//        result.addAll(validate(control.errors));
//      });
//    } else if(control is A
//
//    return {};
  }
}

class NewListing {
  String mainTitleInput;
}
