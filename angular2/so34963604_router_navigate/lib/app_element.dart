library so34963604_router_navigate.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Output;
import 'package:angular2/router.dart'
    show ROUTER_DIRECTIVES, Route, RouteConfig, Router;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<a [routerLink]="['Friends']">Friends</a>
<a [routerLink]="['Some']">Friends</a>
<router-outlet></router-outlet>
<button (click)="navigateFriends()">friends</button>
<button (click)="navigateSome()">some</button>
''',
    directives: const [ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(path: '/friends', name: 'Friends', component: FriendsComponent),
  const Route(path: '/some', name: 'Some', component: SomeComponent)
])
class AppElement {
  Router _router;
  AppElement(this._router);

  void navigateFriends() {
    _router.navigate(['Friends']);
  }

  void navigateSome() {
    _router.navigate(['Some']);
  }
}

@Component(selector: 'friends-component',template: '''
        friends list:
        <ul>
            <li *ngFor="#friend of friends">
                {{friend['id']}}
            </li>
        </ul>
    ''')
class FriendsComponent {
  List<Map> friends = [
    {"id": 11},
    {"id": 22},
    {"id": 33},
  ];
}

@Component(selector: 'some-component',template: '''<div>some-component</div>
''')
class SomeComponent {}
