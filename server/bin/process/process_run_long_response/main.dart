import 'dart:io';
import 'dart:convert' show UTF8;

void main() {
  int i = 0;
  String text = '';
  Process.start('cat', ['messages'], runInShell: true).then((p) {
    p.stdout.transform(UTF8.decoder).listen((data) =>
      text += data);
    p.exitCode.then((_) => print(text));
//    p.kill(ProcessSignal.SIGUSR1);
  });

}

