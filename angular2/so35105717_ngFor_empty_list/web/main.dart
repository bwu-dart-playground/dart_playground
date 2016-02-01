import 'package:angular2/angular2.dart' show provide;
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:so35105717_ngFor_empty_list/app_element.dart' show AppElement, TodoService;

void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    provide(APP_BASE_HREF, useValue: '/'),
    TodoService
//    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
