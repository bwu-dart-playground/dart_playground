import 'package:angular2/core.dart'
    show
    AngularEntrypoint,
        ApplicationRef,
        PlatformRef,
        TestabilityRegistry,
        platform,
        provide,
        reflector;

//import 'package:angular2/router.dart'
//    show
//    APP_BASE_HREF,
//    HashLocationStrategy,
//    LocationStrategy,
//    ROUTER_PROVIDERS;
//import 'package:angular2/bootstrap.dart' show bootstrap;
//import 'package:so36272590_webworker/app_element.dart' show AppElement;
import 'package:angular2/platform/worker_render.dart'
    show MessageBus, WORKER_RENDER_PLATFORM, initIsolate;
//import 'package:angular2/src/core/reflection/reflection_capabilities.dart';
//import 'package:angular2/platform/worker_app.dart';

///
@AngularEntrypoint()
dynamic main() async {
//  reflector.reflectionCapabilities = new ReflectionCapabilities();
  ApplicationRef ref = await platform([WORKER_RENDER_PLATFORM])
      .asyncApplication(initIsolate("my_worker.dart"));
  MessageBus bus = ref.injector.get(MessageBus);
  bus.initChannel("My Custom Channel");
  bus.to("My Custom Channel").emit("Hello from the UI");
////  enableProdMode();
//  bootstrap(AppElement, [
//    ROUTER_PROVIDERS,
//    provide(APP_BASE_HREF, useValue: '/'),
////    provide(LocationStrategy, useClass: HashLocationStrategy)
//  ]);
}
