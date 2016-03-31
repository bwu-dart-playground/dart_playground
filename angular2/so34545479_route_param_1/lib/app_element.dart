library so34545479_route_param_1.app_element;

import 'dart:html' as dom;
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart'
    show ROUTER_DIRECTIVES, Route, RouteConfig, RouteParams, Router;

@Component(selector: 'app-element',
    templateUrl: 'app_element.html',
    directives: const [ROUTER_DIRECTIVES, ShellComponent])
@RouteConfig(const [const Route(path: '/', component: ShellComponent, name: 'Browse')])
class AppElement {
  Router router;
  AppElement(this.router);
  void changeRoute(dom.MouseEvent event) {
    router.navigate(['Browse', { 'a':2, 'b':3, 'c':1 }]);
  }
}

@Component(selector: 'shell-component',template: '')
class ShellComponent implements OnInit {
  Router router;
  RouteParams params;
  ShellComponent(this.router, this.params);

  void ngOnInit() {
//      router.
    print(params.params);
  }
}
