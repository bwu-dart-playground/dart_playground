library router_get_routes.app_element;

import 'package:angular2/angular2.dart'
    show Component, View, Input, Output, FORM_DIRECTIVES, ControlGroup;
import 'package:angular2/router.dart'
    show OnActivate, ROUTER_DIRECTIVES, Route, RouteConfig, RouteRegistry, Router;

@Component(selector: 'app-element',
    template: '''
<h1>app-element</h1>
<router-outlet></router-outlet>
''',
    directives: const [FORM_DIRECTIVES, ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(
      // Crisis Center child route
      path: '/crisis-center/...',
      name: 'CrisisCenter',
      component: SomeComponent,
      useAsDefault: true)
])
class AppElement implements OnActivate {
  Router _router;
  RouteRegistry r;
  AppElement(this._router) {
    _router.subscribe((url) {
      print(url);
    });
    print(_router);
  }
}

@Component(selector: 'some-component',template: 'some-component')
class SomeComponent {}
