// background_index.dart

import 'dart:isolate' show SendPort;
import 'package:angular2/core.dart'
    show Component, Provider, TestabilityRegistry, platform;

//import 'package:so36272590_webworker/app_element.dart' show AppElement;
//import 'package:angular2/angular2.dart' show reflector;
import 'package:angular2/platform/worker_app.dart'
    show
        AngularEntrypoint,
        MessageBus,
        RENDER_SEND_PORT,
        WORKER_APP_APPLICATION,
        WORKER_APP_PLATFORM;

//import "package:angular2/src/core/reflection/reflection.dart";
//import "package:angular2/src/core/reflection/reflection_capabilities.dart"
//    show ReflectionCapabilities;

///
@Component(selector: 'hello-world', template: '<h1>Hello {{name}}</h1>')
class HelloWorld {
  ///
  HelloWorld(MessageBus bus) {
    bus.initChannel("My Custom Channel");
    bus.from("My Custom Channel").listen((message) {
      print(message); // will print "hello from the UI"
    });
  }

  ///
  String name = 'Jane';
}

///
@AngularEntrypoint()
void main(List<String> args, SendPort replyTo) {
//  reflector.reflectionCapabilities = new ReflectionCapabilities();
  platform([
    WORKER_APP_PLATFORM,
    new Provider(RENDER_SEND_PORT, useValue: replyTo)
  ]).application([WORKER_APP_APPLICATION]).bootstrap(HelloWorld);
}
