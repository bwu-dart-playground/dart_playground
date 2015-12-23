library angular2_hero_router.app_component;

import 'package:angular2/core.dart' show Component;
import 'package:angular2/router.dart' show RouteConfig, Route, Redirect, ROUTER_DIRECTIVES;

import 'crisis_center/crisis_center_component.dart' show CrisisCenterComponent;
import 'heroes/hero_list_component.dart' show HeroListComponent;
import 'heroes/hero_detail_component.dart' show HeroDetailComponent;

@Component(
  selector: 'my-app',
// #docregion template
  template: r'''
    <h1 class="title">Component Router</h1>
    <a [routerLink]="['CrisisCenter']">Crisis Center</a>
    <a [routerLink]="['Heroes']">Heroes</a>
    <router-outlet></router-outlet>
  ''',
  directives: const [ROUTER_DIRECTIVES]
)
@RouteConfig(const [
  const Route ( // Crisis Center child route
    path: '/crisis-center/...',
    name: 'CrisisCenter',
    component: CrisisCenterComponent,
    useAsDefault: true
  ),
  const Route(path: '/heroes',   name: 'Heroes',     component: HeroListComponent),
  const Route(path: '/hero/:id', name: 'HeroDetail', component: HeroDetailComponent),
  const Redirect(path: '/disaster', redirectTo: const ['CrisisCenter', 'CrisisDetail', const {'id':3}])
])
class AppComponent { }
