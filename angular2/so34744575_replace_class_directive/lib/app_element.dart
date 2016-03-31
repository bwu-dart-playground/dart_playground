library so34744575_replace_class_directive.app_element;

import 'package:angular2/angular2.dart'
    show
        Attribute,
        Component,
        ControlGroup,
        Directive,
        ElementRef,
        FORM_DIRECTIVES,
        HostBinding,
        Input,
        OnInit,
        Output,
        Renderer,
        View;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<div replaceClass class="class1" [ngClass]="someClass">c1</div>
<div replaceClass class="class1">c2</div>
<div replaceClass class="class2">c2</div>
''',
    styles: const [
      '''
  div.class2 {
    border: 1px solid red;
  }
  '''
    ],
    directives: const [
      ReplaceClass
    ])
class AppElement {
  String someClass = "some-class";
}

@Directive(selector: '[replaceClass]')
class ReplaceClass implements OnInit {
  // couldn't find another way to remove a class
//  ReplaceClass(Renderer renderer, ElementRef elementRef) {
//    // The third argument is false which will remove the class
//    renderer.setElementClass(elementRef.nativeElement, 'class1', false);
//  }

  @Input('class')
  String class1;

  @HostBinding('class.class2')
  bool class2 = false;

  void ngOnInit() {
    print('class1: $class1');
    print('class2: $class2');
    if (class1.split(' ').contains('class1')) {
      class2 = true;
    }
  }
}
