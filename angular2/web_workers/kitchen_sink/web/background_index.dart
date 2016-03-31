library playground.src.web_workers.kitchen_sink.background_index;

import "index_common.dart" show HelloCmp;
import "dart:isolate";
import "package:angular2/platform/worker_app.dart" show RENDER_SEND_PORT, WORKER_APP_APPLICATION, WORKER_APP_PLATFORM;
import "package:angular2/core.dart" show AngularEntrypoint, platform, Provider;

@AngularEntrypoint()
main(List<String> args, SendPort replyTo) {
  platform([WORKER_APP_PLATFORM, new Provider(RENDER_SEND_PORT, useValue: replyTo)])
      .application([WORKER_APP_APPLICATION])
      .bootstrap(HelloCmp);
}
