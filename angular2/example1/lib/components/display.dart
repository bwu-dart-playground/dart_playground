library xxx.display;
import 'package:angular2/angular2.dart';

@Component(selector: 'display',
//  templateUrl: 'packages/bwu_angular_example_1/components/display.html',
  templateUrl: 'display.html',
//    template: '''
//<p>My name: {{ myName }}</p>
//<p>Friends:</p>
//<ul>
//   <li *for="#name of friendNames">
//      {{ name }}
//   </li>
//</ul>
//''',
    directives: const [NgFor])
class DisplayComponent {
  String myName = 'Alice';
  List<String> friendNames = ['Aarav', 'Martín', 'Shannon', 'Ariana', 'Kai'];
}

