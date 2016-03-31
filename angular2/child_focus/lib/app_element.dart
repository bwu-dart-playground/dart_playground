library child_focus.app_element;

import 'package:angular2/angular2.dart';

@Component(selector: 'app-element',templateUrl: 'app_element.html', directives: const [MyComp]
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {}

//TODO(zoechi) doesn't work at all
@Component(
    selector: 'my-comp',
    template:
        '<div>before</div><textarea tab-index="1">some text</textarea><div>after</div>')
class MyComp {}
