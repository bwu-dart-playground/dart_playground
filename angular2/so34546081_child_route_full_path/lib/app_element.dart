library so34546081_child_route_full_path.app_element;

import 'dart:html' as dom;
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart'
    show
        Location,
        ROUTER_DIRECTIVES,
        Route,
        RouteConfig,
        RouteParams,
        Router,
        Redirect;

@Component(selector: 'app-element',
    templateUrl: 'app_element.html',
    directives: const [ROUTER_DIRECTIVES, ChildComponent])
@RouteConfig(const [
  const Route(path: '/parent/...', component: ChildComponent, name: 'Parent')
])
class AppElement implements OnInit {
  Router router;
  Location location;
  AppElement(this.router, this.location);
  void changeRoute(dom.MouseEvent event) {
    router.navigate([
      '/Parent/Child',
      {'a': 2, 'b': 3, 'c': 1}
    ]);
  }

  @override
  ngOnInit() {
    router.subscribe((e) {
      print(e);
    });
  }
}

@Component(selector: 'child-component',
    template: '''
    child
    <router-outlet></router-outlet>''',
    directives: const [ROUTER_DIRECTIVES, OtherComponent])
@RouteConfig(const [
  const Redirect(path: './child', redirectTo: const ['Child']),
  const Route(path: './childRedirect', component: OtherComponent, name: 'Child')
])
class ChildComponent implements OnInit {
  Router router;
  Location location;
  ChildComponent(this.router, this.location);
  void changeRoute(dom.MouseEvent event) {
    router.navigate([
      'Child',
      {'a': 2, 'b': 3, 'c': 1}
    ]);
  }

  void ngOnInit() {
    print(location.path());
    router.recognize('/parent/child').then((e) {
      print(e);
    });

    router.recognize(location.path()).then((e) {
      print(e);
    });
    router.parent.recognize(location.path()).then((e) {
      print(e);
    });
  }
}

@Component(selector: 'other-component',template: 'other')
class OtherComponent implements OnInit {
  Router router;
  RouteParams params;
  Location location;

  OtherComponent(this.router, this.params, this.location);

  void ngOnInit() {
    print(location.path());
    router.recognize('/parent/child').then((e) {
      print(e);
    });

    router.recognize(location.path()).then((e) {
      print(e);
    });
    router.parent.recognize(location.path()).then((e) {
      print(e);
    });
    router.parent.parent.recognize(location.path()).then((e) {
      print(e);
    });
  }
}
