library structural_directive_custom_ng_for_with_template.app_element;

import 'package:angular2/angular2.dart'
    show Component, ControlGroup, ExceptionHandler, FORM_DIRECTIVES, Input, NgFor, Output, View;

import 'virtual_list.dart';

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<!--<div *virtualList="#data of dataList">{{data}}</div>-->
<child-element>
  <div *virtualList="#data of dataList">{{data}}</div>
</child-element>
''',
    directives: const [ChildElement, VirtualList])
class AppElement {
  ExceptionHandler h;
  List<String> dataList = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z'
  ];
}

@Component(selector: 'child-element',template: '''
<h1>child-element</h1>
<ng-content></ng-content>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class ChildElement {}
