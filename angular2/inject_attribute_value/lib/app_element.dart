library inject_attribute_value.app_element;

import 'package:angular2/angular2.dart' show Attribute, Component, Directive, View;

@Component(
    selector: 'app-element'
)
@View(
    template: '''
<input type="text">
''',
    directives: const [InputAttrDirective]
)
class AppElement {
}

@Directive(
    selector: 'input'
)
class InputAttrDirective {
  String type;
  InputAttrDirective(@Attribute('type') this.type) {
    print('type: type');
  }
}
