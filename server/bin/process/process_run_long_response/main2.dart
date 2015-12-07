import 'dart:async' show Future;
import 'dart:io';
import 'dart:convert' show UTF8;

main() {
  doSomething();
}

doSomething() async {
//  int i = 0;
//  String text = '';
  print('before process start ${Directory.current}');
  var process = await Process.start('/bin/bash', ['-c', 'cat bin/process/process_run_long_response/messages']);
  print('after process start');
//  await process.stdout.transform(UTF8.decoder).pipe(stdout);
  await process.stdout.pipe(stdout);
//  var subscription = process.stdout.listen((data) {
//    print(data);
//  });
  await process.stderr.pipe(stderr);

//  await subscription.asFuture();
//  await process.exitCode.then((ec) => print('done: $ec'));
////    p.kill(ProcessSignal.SIGUSR1);
//  await new Future.delayed(const Duration(seconds: 10), () {});

}
