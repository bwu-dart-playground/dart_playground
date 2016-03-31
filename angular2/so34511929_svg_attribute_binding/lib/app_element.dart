library so34511929_svg_attribute_binding.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' //,
//    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  Rect rect = new Rect();
}

class Rect {
  int x = 10;
  int y = 11;
  int width = 12;
  int height = 13;
  String fill = 'red';
  String stroke = 'blue';
}
