library so34740382_style_encapsulation.app_element;

import 'package:angular2/angular2.dart'
    show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;

@Component(selector: 'app-element',
    template: '''
<h1 class="nav">Parent Header</h1><customer></customer>
''',
    directives: const [CustomerComponent])
class AppElement {}

@Component(
    selector: 'customer',
    template: '<h1 class="nav">Child header</h1>',
    styleUrls: const ['customer.css']
//    ,styles: const [
//      '''
//	h1{background-color:red;}'''
//    ]
)
class CustomerComponent {}
