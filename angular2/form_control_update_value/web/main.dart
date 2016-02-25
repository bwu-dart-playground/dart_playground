import 'package:angular2/router.dart'
    show
        APP_BASE_HREF,
        HashLocationStrategy,
        LocationStrategy,
        ROUTER_PROVIDERS;
import 'package:angular2/bootstrap.dart' show bootstrap;
import 'package:form_control_update_value/app_element.dart' show AppElement;
import 'package:angular2/platform/browser.dart' show ELEMENT_PROBE_PROVIDERS, enableDebugTools;
import 'package:angular2/core.dart' show ComponentRef, provide;
import 'package:angular2/platform/browser.dart' show inspectNativeElement;
import 'dart:js' show context;
import 'package:angular2/src/core/linker/view_manager.dart';
import 'package:angular2/src/platform/browser_common.dart';

void main() {
//  enableProdMode();
  bootstrap(AppElement, [
    ROUTER_PROVIDERS,
    provide(APP_BASE_HREF, useValue: '/'),
//    bind(LocationStrategy).toClass(HashLocationStrategy)
//    ELEMENT_PROBE_PROVIDERS,
//    provide(AppViewManager, useClass: DebugElement)
  ]).then((ComponentRef appRef) {
//    initDomAdapter();
//    enableDebugTools(appRef);
  });
}
