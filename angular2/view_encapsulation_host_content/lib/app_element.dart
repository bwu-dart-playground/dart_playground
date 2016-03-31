library view_encapsulation_host_content.app_element;

import 'package:angular2/angular2.dart'
    show
        Component,
        ControlGroup,
        FORM_DIRECTIVES,
        Input,
        Output,
        View,
        ViewEncapsulation;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<list-component><li>item 2</li><div class="c">c2</div></list-component>
''',
    directives: const [ListComponent],
    encapsulation: ViewEncapsulation.Native)
class AppElement {}

@Component(selector: 'list-component',
    styles: const [
      '''
:host li {
  /*This will only apply to the <li> defined in this template.*/
  color:red;
}

:host ::content li {
  /*I want to style the elements inside ng-content here. It applies to all <li> elements*/
  font-weight:bold;
}

:host .c {
  /*This will only apply to the <li> defined in this template.*/
  color:red;
}

::content .c{
  /*I want to style the elements inside ng-content here. It applies to all <li> elements*/
  font-weight:bold;
}

'''
    ],
    template: '''
<h1>list-component</h1>
<ul>
  <li>item 1</li>
  <content></content>
</ul>
<div class="c">c1</div>
<content select=".c"></content>
''',
    encapsulation: ViewEncapsulation.Native)
class ListComponent {}
