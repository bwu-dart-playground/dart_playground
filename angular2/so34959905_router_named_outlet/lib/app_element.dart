library so34959905_router_named_outlet.app_element;

import 'package:angular2/core.dart' show Component, View, Input, Output;
import 'package:angular2/router.dart'
    show
        AuxRoute,
        ROUTER_DIRECTIVES,
        Route,
        RouteConfig,
        RouteData,
        Router,
        RouterLink,
        RouterOutlet;

///
// aux routes are broken https://github.com/angular/angular/issues/4945
// http://plnkr.co/edit/lquMdagaVfIoAT83w1pl?p=preview
@Component(
    selector: 'app-element',
    template: '''
<h1>app-element</h1>
<button (click)="salesDetail()">salesdetail</button>
<a [routerLink]="['/SalesOverview','SalesDetail']">SalesOverview</a>
<a [routerLink]="['/PurchOverview']">PurchOverview</a>
<a [routerLink]="['/InventoryOverview']">InventoryOverview</a>

<side-bar></side-bar>
<router-outlet></router-outlet>
<router-outlet name="salesdetail"></router-outlet>
''',
    directives: const [SideBar, ROUTER_DIRECTIVES])
@RouteConfig(const [
  const Route(
      path: '/salesoverview', name: 'SalesOverview', component: SalesOverview),
  const AuxRoute(
      path: '/salesdetail', name: 'SalesDetail', component: SalesDetail),
  const Route(
      path: '/purchoverview', name: 'PurchOverview', component: PurchOverview),
  const Route(
      path: '/inventoryoverview',
      name: 'InventoryOverview',
      component: InventoryOverview)
])
class AppElement {
  Router _router;
  ///
  AppElement(this._router);
  ///
  void salesDetail() {
    _router.navigateByUrl('/salesoverview(salesdetail)');
  }
}

///
@Component(
    selector: 'side-bar',
    template: '''
<h1>side-bar</h1>
''',
    styles: const [
      '''
:host {
  display: block;
 }
 a {
  display: block;
 }
'''
    ],
    directives: const [
      ROUTER_DIRECTIVES
    ])
class SideBar {}

///
@Component(
    selector: 'sales-overview',
    template: '''
<h1>sales-overview</h1>
''')
class SalesOverview {}

///
@Component(
    selector: 'detail',
    template: '''
<h1>sales-detail</h1>
''')
class SalesDetail {}

///
@Component(
    selector: 'purch-overview',
    template: '''
<h1>purch-overview</h1>
''')
class PurchOverview {}

///
@Component(
    selector: 'purch-detail',
    template: '''
<h1>purch-detail</h1>
''')
class PurchDetail {}

///
@Component(
    selector: 'inventory-overview',
    template: '''
<h1>inventory-overview</h1>
''')
class InventoryOverview {}

///
@Component(
    selector: 'inventory-detail',
    template: '''
<h1>inventory-detail</h1>
''')
class InventoryDetail {}
