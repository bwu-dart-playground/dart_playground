library so35135260_ng_form_model_reference.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        View,
        Input,
        Output,
        FORM_DIRECTIVES,
        ControlGroup,
        NgForm,
        FormBuilder,
        Validators;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<form [ngFormModel]="myForm"
      (ngSubmit)="onSubmit(myForm.value)"
      class="ui form">

  <div class="field"
       [class.error]="!myForm.find('sku').valid && myForm.find('sku').touched">
    <label for="skuInput">SKU</label>
    <input type="text"
           id="skuInput"
           placeholder="SKU"
           #sku="ngForm"
           [ngFormControl]="myForm.controls['sku']">
    <div *ngIf="!sku.control.valid"
         class="ui error message">SKU is invalid</div>
    <div *ngIf="sku.control.hasError('required')"
         class="ui error message">SKU is required</div>
  </div>

  <div *ngIf="!myForm.valid"
       class="ui error message">Form is invalid</div>

  <button type="submit" class="ui button">Submit</button>
</form>
''',
    directives: const [FORM_DIRECTIVES])
class AppElement {
  ControlGroup myForm;
  AppElement(FormBuilder fb) {
    myForm = fb.group({
      'sku': ['', Validators.required]
    });
  }

  void onSubmit(value) {
    print('you submitted value: ${value['sku']}');
  }
}
