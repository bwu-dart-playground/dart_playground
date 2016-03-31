library function_binding.app_element;

import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' ,
    directives: const [NgClass]
)
class AppElement {
  String firstName = 'Günter';
  String lastName = 'Zöchbauer';
  String fullName() => '${firstName} ${lastName}';
  void alertFullName() => print(fullName());
}
