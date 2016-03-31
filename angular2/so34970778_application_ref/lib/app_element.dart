library so34970778_application_ref.app_element;

import 'package:angular2/angular2.dart' show ApplicationRef, Component, ControlGroup, ElementRef, FORM_DIRECTIVES, Injector, Input, Output, View;

@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<child-element></child-element>
''' ,
    directives: const [ChildElement]
)
class AppElement {
}

@Component(
    selector: 'child-element'
,
    template: '''
<h1>child-element</h1>
<grandchild-element></grandchild-element>
''' ,
    directives: const [GrandChildElement]
)
class ChildElement {
}

@Component(
    selector: 'grandchild-element'
,
    template: '''
<h1>grandchild-element</h1>
'''
)
class GrandChildElement {
  var ref;
  GrandChildElement(ApplicationRef appRef, Injector injector) {
    ref = injector.get(appRef.componentTypes[0]);
    print('x');
  }
}

