library ng_for.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' ,
    directives: const [NgFor]
)
class AppElement {
  List fruits = ['Orange', 'Banana', 'Apple'];
}
