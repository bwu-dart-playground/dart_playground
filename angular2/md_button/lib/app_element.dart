library md_button.app_element;

import 'package:angular2/angular2.dart';
import 'package:angular2_material/src/components/button/button.dart';

@Component(
    selector: 'app-element',
    templateUrl: 'app_element.html',
    directives: const [MdButton])
class AppElement {}
