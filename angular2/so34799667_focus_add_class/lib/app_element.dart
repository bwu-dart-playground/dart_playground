library so34799667_focus_add_class.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        Directive,
        FORM_DIRECTIVES,
        Input,
        Output,
        View;

@Component(selector: 'app-element')
@View(
    styles: const [
      '''
    input.md-input-focus {
      border: 3px solid red;
    }
    '''
    ],
    template: '''
<h1>app-element</h1>
<input class="mdInput">
<input class="mdInput">
''',
    directives: const [MaterialDesignDirective])
class AppElement {}

@Directive(selector: '.mdInput', host: const {
  '(focus)': 'setInputFocus(true)',
  '(blur)': 'setInputFocus(false)',
  '[class.md-input-focus]': 'inputFocusClass'
})
class MaterialDesignDirective {
  MaterialDesignDirective() {
    print('xxx');
  }
  bool inputFocusClass = false;

  onFocus() {
    this.inputFocusClass = true;
  }
  setInputFocus(bool isSet) {
    this.inputFocusClass = isSet;
  }

  onBlur() {
    this.inputFocusClass = false;
  }
}
