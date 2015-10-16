import 'dart:io' as io;
import 'dart:async' show Future, Stream, StreamController, StreamSubscription;

main() {
  io.Process.start('pub', ['list','of','args']).then((io.Process proc) {
    StreamController sc = new StreamController();
    StreamSubscription subscr = proc.stdout.listen(io.stdout.add);
    subscr.cancel();
    io.stdout.addStream(proc.stderr);
    return proc.exitCode;
  });
}
