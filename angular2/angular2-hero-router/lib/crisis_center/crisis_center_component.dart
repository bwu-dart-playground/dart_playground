import 'package:angular2/core.dart' show Component;
import 'package:angular2/router.dart' show RouteConfig, Route, RouterOutlet;

import 'crisis_list_component.dart' show CrisisListComponent;
import 'crisis_detail_component.dart' show CrisisDetailComponent;
import 'crisis_service.dart' show CrisisService;

// #docregion minus-imports
@Component(
  template:  r'''
    <h2>CRISIS CENTER</h2>
    <router-outlet></router-outlet>
  ''',
  directives: const [RouterOutlet],
  providers:  const [CrisisService]
)
@RouteConfig(const [
  const Route(path:'/',         name: 'CrisisCenter', component: CrisisListComponent, useAsDefault: true),
  const Route(path:'/:id',      name: 'CrisisDetail', component: CrisisDetailComponent),
  const Route(path:'/list/:id', name: 'CrisisList',   component: CrisisListComponent)
])
class CrisisCenterComponent { }
