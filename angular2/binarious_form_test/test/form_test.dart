@TestOn('browser')

library bwu_ng_iron_list.test.array_selector_test;

import 'package:test/test.dart';
import 'package:angular2/angular2.dart';
import 'package:angular2_testing/angular2_testing.dart';
import 'package:binarious_form_test/app_element.dart';
import 'dart:html' show CustomEvent, Element, InputElement, SelectElement;

@Component(
    selector: 'form-test-cmp',
    directives: const [FormElement],
    template: '''
<form-element></form-element>
''')
class FormTestCmp {
  @ViewChild(FormElement) FormElement formElement;
}

void main() {
  initAngularTests();
  group('basic', () {
//    setUpProviders(() => [
//      provide(FORM_DIRECTIVES)
//     ]);
    ngTest('single selection', (TestComponentBuilder tcb) async {
      ComponentFixture tc = await tcb.createAsync(FormTestCmp);
      Element testCmpNative = tc.nativeElement;
      tc.detectChanges();
      FormElement el =
          (tc.componentInstance as FormTestCmp).formElement;

      (el.form.controls['firstName'] as Control).updateValue('my first name');
      (el.form.controls['streetAddress'] as Control).updateValue('my street address');
      (el.form.controls['zip'] as Control).updateValue('12345');
      (el.form.controls['type'] as Control).updateValue('home');

//      InputElement firstName = testCmpNative.querySelector('#firstName');
//      firstName.value = 'my first name';
//      firstName.dispatchEvent(new CustomEvent('input'));
//
//      InputElement streetAddress = testCmpNative.querySelector('#streetAddress');
//      streetAddress.value = 'my street address';
//      streetAddress.dispatchEvent(new CustomEvent('input'));
//
//      InputElement zip = testCmpNative.querySelector('#zip');
//      zip.value = '12345';
//      zip.dispatchEvent(new CustomEvent('input'));
//
//      SelectElement type = testCmpNative.querySelector('#type');
//      type.value = 'home';
//      type.dispatchEvent(new CustomEvent('input'));

      tc.detectChanges();
//      el.form.updateValueAndValidity(onlySelf: false);
//      el.form.controls.forEach((name, control) => (control as Control).updateValue(control.value, onlySelf: false));

      expect(el.form.valid, true);
    });
  });
}
