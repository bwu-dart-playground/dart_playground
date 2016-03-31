library displaying_data;

// see https://github.com/angular/angular/pull/3078
import 'package:angular2/bootstrap.dart';
import 'package:angular2/angular2.dart';


//import 'package:angular2/src/reflection/reflection.dart' show reflector;
//import 'package:angular2/src/reflection/reflection_capabilities.dart'
//    show ReflectionCapabilities;
//import 'package:bwu_angular_example_1/components/display.dart';

@Component(selector: 'display',
//  templateUrl: 'packages/bwu_angular_example_1/components/display.html',
    template: '''
<p>My name: {{ myName }}</p>
<p>Friends:</p>
<ul>
   <li *for="#name of friendNames">
      {{ name }}
   </li>
</ul>
''',
    directives: const [NgFor])
class DisplayComponent {
  String myName = 'Alice';
  List<String> friendNames = ['Aarav', 'Martín', 'Shannon', 'Ariana', 'Kai'];
}

main() {
//  reflector.reflectionCapabilities = new ReflectionCapabilities();
  bootstrap(DisplayComponent);
}
