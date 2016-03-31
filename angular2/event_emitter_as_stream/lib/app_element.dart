library event_emitter_as_stream.app_element;

import 'package:angular2/core.dart'
    show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;

@Component(selector: 'my-over',
    styles: const ['div: { width: 500px; height: 500px; }'],
    template: '''
<h1>app-element</h1>
<div (mouseover)="mouseover(event)"> hover </div>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class MyOver {}

@Component(selector: 'app-element',
    directives: const [MyOver],
    template: '''
<h1>app-element</h1>
<my-over (over)="></my-over>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {}
