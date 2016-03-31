library displaying_data.show_properties;

import 'package:angular2/angular2.dart';
import 'dart:async';

@Component( selector: 'display', template: '''
<p>My name: {{ myName }}</p>
<p>Current time: {{ time }}</p>
<p>Friends:</p>
<ul>
   <li *ng-for="#name of friendNames">
      {{ name }}
   </li>
</ul>
''', directives: const [NgFor] )
class DisplayComponent {
  String myName = 'Alice';
  String time;
  Timer _timer;

  List<String> friendNames = const [
    'Aarav',
    'Martín',
    'Shannon',
    'Ariana',
    'Kai'
  ];

  DisplayComponent( ) {
    _updateTime( null );
    _timer = new Timer.periodic( new Duration( seconds: 1 ), _updateTime );
  }

  _updateTime( Timer _ ) {
    time = new DateTime.now( ).toString( );
  }

}
