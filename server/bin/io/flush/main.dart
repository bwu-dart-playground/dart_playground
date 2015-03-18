import 'dart:io' as io;
import 'dart:async' show Future;

// https://code.google.com/p/dart/issues/detail?id=20357
void main() {
  print('bla');
  Future.wait([io.stdout.flush(), io.stderr.flush()]).then((_) => io.exit(0));
}
