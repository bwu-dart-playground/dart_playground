library inject_attribute_value.app_element;

import 'package:angular2/angular2.dart' show Attribute, Component, Directive, Input, View;

@Component(
    selector: 'app-element'
,
    template: '''
<some-element type="text"></some-element>
''',
    directives: const [InputAttrDirective]
)
class AppElement {
}

@Component(
    selector: 'some-element',
    template: '''
<div>type: {{type}}</div>
<div>someType: {{someType}}</div>
'''
)
class InputAttrDirective {
  String type;
  InputAttrDirective(@Attribute('type') this.type);

  @Input('type') String someType;
}
