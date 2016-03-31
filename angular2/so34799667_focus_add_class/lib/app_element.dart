library so34799667_focus_add_class.app_element;

import 'dart:html' show Element;
import 'package:angular2/angular2.dart'
    show Component, ControlGroup, Directive, ElementRef, FORM_DIRECTIVES, Input, OnInit, Output, Renderer, View;

@Component(selector: 'app-element',
    styles: const [
      '''
    div.md-input-focus {
      border: 3px solid red;
      margin: 10px;
      padding: 10px;
    }
    '''
    ],
    template: '''
<h1>app-element</h1>
<div class="md-input-wrapper">
   <input type="text" class="md-input">
</div>

<div class="md-input-wrapper">
   <input type="text" class="md-input">
</div>
''',
    directives: const [MaterialDesignDirective])
class AppElement {}


@Directive(selector: '.md-input', host: const {
  '(focus)': 'setInputFocus(true)',
  '(blur)': 'setInputFocus(false)',
//  '[class.md-input-focus]': 'inputFocusClass'
})
class MaterialDesignDirective {
  ElementRef elementRef;
  Renderer renderer;
  MaterialDesignDirective(this.elementRef, this.renderer) {
    print('xxx');
  }
  bool inputFocusClass = false;

//
//  ngOnInit() {
//
//  }
//  onFocus() {
//    this.inputFocusClass = true;
//  }
  void setInputFocus(bool isSet) {

    renderer.setElementClass(elementRef.nativeElement.parent, 'md-input-focus', isSet);
  }

//  onBlur() {
//    this.inputFocusClass = false;
//  }
}



@Directive(selector: '.mdInput', host: const {
  '(focus)': 'setInputFocus(true)',
  '(blur)': 'setInputFocus(false)',
  '[class.md-input-focus]': 'inputFocusClass'
})
class MaterialDesignDirective2 {
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
