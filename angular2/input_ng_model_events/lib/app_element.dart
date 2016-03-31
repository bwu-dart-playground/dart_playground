library input_ng_model_events.app_element;

import 'dart:html' as dom;
import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' ,
    directives: const [FORM_DIRECTIVES]
)
class AppElement {
  @Input() String inputValue = '';
  @Input() String inputValue2 = '';
  @ViewChild('#input2') dom.InputElement input2;
  void input2Changed(dom.Event event) {
    inputValue2 = input2.value;
  }
}
