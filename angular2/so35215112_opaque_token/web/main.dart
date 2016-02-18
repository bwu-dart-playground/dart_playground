import 'package:angular2/core.dart' show provide, OpaqueToken;
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:so35215112_opaque_token/app_element.dart' show AppElement, globalConfigValue;

void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    provide(APP_BASE_HREF, useValue: '/'),
    provide(globalConfigValue, useValue: '44332211'),
//    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
