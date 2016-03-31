library form_control_update_value.app_element;

import 'package:angular2/angular2.dart' show Component, Control, ControlGroup, FORM_DIRECTIVES, Input, NgControl, NgForm, Output, View, ViewChild;

@Component(selector: 'app-element',
    template: r'''
<h1>app-element</h1>
<form #f="ngForm"
    (ngSubmit)="onSubmit(f)"
    class="ui form">
  <label for="i1">I1</label><input id="i1" ngControl="sku" #sku min-length="3">
  <button type="submit" class="ui button">Submit</button>
</form>
<button (click)="updateValue()">update</button>
''',

    directives: const [FORM_DIRECTIVES])
class AppElement {
  @ViewChild(NgForm) NgForm form;

  String i1='blabla';
  void onSubmit(NgForm form) {
    print(form.value);
    f
  }

  void updateValue() {
    (form.controls['sku'] as Control).updateValue('xxxxx');
  }
}
