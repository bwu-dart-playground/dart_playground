library view_encapsulation.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element',template: '<some-element><child-element></child-element></some-element>', directives: const [SomeElement,ChildElement])
class AppElement {}

@Component(selector: 'some-element', host: const {'class': 'container'}, directives: const [],template: '<div>some-element</div><ng-content></ng-content>', styles: const [
  '''
  :host(.container) {
    display: block;
    border: 1px solid red;
    height: 300px;
  }
  body div {
    background-color: yellow;
  }
'''
])
class SomeElement {}

@Component(selector: 'child-element', host: const {'class': 'container'},template: '<div>child-element</div>', styles: const [
  '''
  :host(.container) {
    display: block;
    border: 3px solid green;
    height: 100px;
  }
'''
])
class ChildElement {}
