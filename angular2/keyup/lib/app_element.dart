library keyup.app_element;

import 'dart:html' as dom;
import 'package:angular2/angular2.dart';

@Component(
    selector: 'app-element'
,
    templateUrl: 'app_element.html' ,
    directives: const [NgFor]
)
class AppElement {
  List<String> messages = [];
  @HostListener('keydown.control.k', const ['\$event'])
  void keyUpHandler(dom.KeyboardEvent event) {
    messages.add('${event.type} ctrl: ${event.ctrlKey}+${event.keyCode}');
  }
}
