library playground.src.web_workers.router.background_index;

import "index_common.dart" show App;
import "dart:isolate";
import "package:angular2/platform/worker_app.dart";
import "package:angular2/core.dart";
import "package:angular2/src/web_workers/worker/router_providers.dart";
import "package:angular2/router.dart";

@AngularEntrypoint()
main(List<String> args, SendPort replyTo) {
  platform([
    WORKER_APP_PLATFORM,
    new Provider(RENDER_SEND_PORT, useValue: replyTo)
  ]).asyncApplication(null, [
    WORKER_APP_APPLICATION,
    WORKER_APP_ROUTER,
    new Provider(LocationStrategy, useClass: HashLocationStrategy)
  ]).then((ref) => ref.bootstrap(App));
}
