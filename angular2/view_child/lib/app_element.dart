library view_child.app_element;

import 'dart:async' show Future;
import 'package:angular2/angular2.dart';

@Component(selector: 'app-element')
@View(
    templateUrl: 'app_element.html',
    directives: const [MyComponent, SomeChild, SomeOtherChild])
class AppElement implements AfterViewInit {

  @ViewChild('someChild')
  var someChild;

  @ViewChild(SomeChild)
  var someChild2;

  @ViewChild('div')
  var someChild3;

  @ViewChild('otherChild')
  var otherChild;

  @ViewChild(SomeOtherChild)
  var otherChild2;

  void ngAfterViewInit() {
    new Future(() {
      print('someChild: $someChild');
      print('someChild2: $someChild2');
      print('someChild3: $someChild3');
      print('otherChild: $otherChild');
      print('otherChild2: $otherChild2');
    });
  }
}

@Component(selector: 'my-comp')
@View(
    template: '''
<h3>my-comp</h3>
<ng-content></ng-content>
<content></content>
''')
class MyComponent {}

@Component(selector: 'some-child')
@View(
    template: '''
<h3>some-child</h3>
''',
    directives: const [SomeOtherChild])
class SomeChild {}

@Component(selector: 'some-other-child')
@View(
    template: '''
<h3>some-other-child</h3>
<div #someChild></div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class SomeOtherChild {}
