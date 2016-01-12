import 'package:angular2/angular2.dart' show FORM_PROVIDERS, bind;
import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:so34705010_form/app_element.dart' show AppElement;

void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
//    FORM_PROVIDERS,
    bind(APP_BASE_HREF).toValue('/'),
//    bind(LocationStrategy).toClass(HashLocationStrategy)
  ]);
}
