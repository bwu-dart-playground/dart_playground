library structural_directive_custom_ng_for_with_template.app_element;

import 'package:angular2/angular2.dart'
    show Component, ControlGroup, FORM_DIRECTIVES, Input, NgFor, Output, View;

@Component(selector: 'app-element')
@View(
    template: '''
<h1>app-element</h1>
  <div *virualList="data of dataList">
''',
    directives: const [ChildElement])
class AppElement {
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

@Component(selector: 'child-element')
@View(template: '''
<h1>child-element</h1>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class ChildElement {}
