library content_child.app_element;

import 'dart:async' show Future;
import 'package:angular2/angular2.dart';

@Component(selector: 'app-element',
template: '''
<h1>app-element</h1>
<my-comp>
  <some-child></some-child>
  <div #someChild></div>
  <some-other-child #otherChild></some-other-child>

</my-comp>
''',
    directives: const [MyComponent, SomeChild, SomeOtherChild])
class AppElement {}

@Component(selector: 'my-comp',
    template: '''
<h3>my-comp</h3>
<ng-content></ng-content>
<content></content>
''')
class MyComponent implements AfterContentInit, AfterViewInit {

  ElementRef elementRef;
  MyComponent(this.elementRef);

  @ContentChild('someChild')
  var someChild;

  @ContentChild(SomeChild)
  var someChild2;

  @ContentChildren(SomeChild)
  QueryList someChild4;

  @ContentChild('div')
  var someChild3;

  @ContentChild('otherChild')
  var otherChild;

  @ContentChild(SomeOtherChild)
  var otherChild2;

  void ngAfterContentInit() {
    new Future(() {
      print('someChild: $someChild');
      print('someChild2: $someChild2');
      print('someChild3: $someChild3');
      print('someChild4: $someChild4');
      print('otherChild: $otherChild');
      print('otherChild2: $otherChild2');
    });
    print(elementRef.nativeElement.innerHtml);
  }

  void ngAfterViewInit() {
    print(elementRef.nativeElement.innerHtml);
  }
}

@Component(selector: 'some-child',
    template: '''
<h3>some-child</h3>
''',
    directives: const [SomeOtherChild])
class SomeChild {}

@Component(selector: 'some-other-child',
    template: '''
<h3>some-other-child</h3>
<div #someChild></div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class SomeOtherChild {}
