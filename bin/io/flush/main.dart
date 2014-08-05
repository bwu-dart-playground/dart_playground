import 'dart:io' as io;

// https://code.google.com/p/dart/issues/detail?id=20357
void main() {
  print('bla');
  io.stderr.flush();
}
