library displaying_data.show_properties;

import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:displaying_data/friends_service.dart';

@Component(selector: 'display', viewProviders: const [FriendsService],
    template: '''
<p>My name: {{ myName }}</p>
<p>Current time: {{ time }}</p>
<p>Friends:</p>
<ul>
   <li *ng-for="#name of friendsService.names">
      {{ name }}
   </li>
   <p *ng-if="friendsService.names.length > 3">You have many friends!</p>
</ul>
''', directives: const [NgFor,NgIf])
class DisplayComponent {
  String myName = 'Alice';
  String time;
  Timer _timer;
  FriendsService friendsService;

  DisplayComponent(this.friendsService) {
    _updateTime(null);
    _timer = new Timer.periodic(new Duration(seconds: 1), _updateTime);
  }

  void _updateTime(Timer _) {
    time = new DateTime.now().toString();
  }
}
