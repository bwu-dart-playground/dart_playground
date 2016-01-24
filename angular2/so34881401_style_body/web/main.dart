import 'package:angular2/angular2.dart' show DomAdapter, bind, provide;
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:so34881401_style_body/app_element.dart' show AppElement, LoginService;
import 'package:angular2/platform/browser.dart';

void main() {
//  enableProdMode();
  BrowserDomAdapter.makeCurrent();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    bind(APP_BASE_HREF).toValue('/'),
    LoginService,
//    provide(DomAdapter, useClass: BrowserDomAdapter)
//    bind(LocationStrategy).toClass(HashLocationStrategy)
  ]);
}
