library attribute_binding.app_element;

import 'package:angular2/angular2.dart';
import 'package:attribute_binding/app_element.dart';

@Component(selector: 'app-element', templateUrl: 'app_element.html', directives: const[])
class AppElement {
  @Input() String attr2 = 'bla';
//  @HostBinding('my-attr') String get myAttr => attr2;
}
