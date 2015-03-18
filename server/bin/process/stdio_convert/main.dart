import 'dart:io';
import 'dart:convert';
import 'dart:async';

void main() {
  StreamController<String> input = new StreamController<String>.broadcast();

  print('start');
  Process.run("/bin/bash", ['-c', '/usr/bin/python -V']/*, runInShell: true*/).then((Process p) {
    print(p.pid);
    p.stdout.listen((stdOut) => print(UTF8.decoder.convert(stdOut)));
    p.stderr.listen((stdOut) => print(UTF8.decoder.convert(stdOut)));
    //process.stdout.listen((stdOut) => print(UTF8.decoder.convert(stdOut)));
    //process.stdin.addStream(UTF8.encoder.bind(input.stream));
  });

  input.add('blabla');
}

