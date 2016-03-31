library dynamic_component_loader_ng_content.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ComponentRef,
        ControlGroup,
        DynamicComponentLoader,
        ElementRef,
        FORM_DIRECTIVES,
        Injector,
        Input,
        Output,
        View,
        ViewEncapsulation;

/// Gitter @vladotesanovic

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<parent-element></parent-element>
''',
    directives: const [ParentElement])
class AppElement {}

@Component(
    selector: 'parent-element',
    directives: const [],

//@View(
    template: '''
<h1>parent-element</h1>
<div #child></div>

<content><div>target</div></content>
''',
    encapsulation: ViewEncapsulation.Native)
class ParentElement {
  Injector _injector;
  ElementRef _elementRef;
  DynamicComponentLoader _dcl;
  ParentElement(this._injector, this._elementRef, this._dcl) {
    _dcl
        .loadIntoLocation(DclChildElement, _elementRef, 'child')
//        .loadNextToLocation(DclChildElement, _elementRef)
        .then((ComponentRef ref) {
      print(ref);
    });
  }
}

@Component(selector: 'dcl-child',template: '''
<h1>dcl-child</h1>
<div>someString: { {someString} }</div>
''')
class DclChildElement {
  @Input() String someString;
//  ElementRef _elementRef;
//  DynamicComponentLoader _dcl;
//  DclChildElement(this._elementRef, this._dcl);
}
