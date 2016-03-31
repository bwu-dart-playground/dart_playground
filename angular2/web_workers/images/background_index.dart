library playground.src.web_workers.images.background_index;

import "index_common.dart" show ImageDemo;
import "dart:isolate";
import "package:angular2/platform/worker_app.dart";
import "package:angular2/core.dart";
import "package:angular2/src/core/reflection/reflection_capabilities.dart";
import "package:angular2/src/core/reflection/reflection.dart";

main(List<String> args, SendPort replyTo) {
  reflector.reflectionCapabilities = new ReflectionCapabilities();
  platform([
    WORKER_APP_PLATFORM,
    new Provider(RENDER_SEND_PORT, useValue: replyTo)
  ]).application([WORKER_APP_APPLICATION]).bootstrap(ImageDemo);
}
