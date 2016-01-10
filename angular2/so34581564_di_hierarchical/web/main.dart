import 'package:angular2/angular2.dart' show bind, provide;
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:so34581564_di_hierarchical/app_element.dart' show AppElement, OtherService, OtherServiceImpl2;

void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    bind(APP_BASE_HREF).toValue('/'),
//    provide(OtherService, useClass: OtherServiceImpl2)
//    bind(LocationStrategy).toClass(HashLocationStrategy)
  ]);
}
