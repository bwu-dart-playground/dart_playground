library angular2.examples.web_workers.kitchen_sink.index;

import "package:angular2/platform/worker_render.dart";
import "package:angular2/core.dart" show AngularEntrypoint, platform;

@AngularEntrypoint()
main() {
  platform([WORKER_RENDER_PLATFORM])
      .asyncApplication(initIsolate("background_index.dart"));
}
