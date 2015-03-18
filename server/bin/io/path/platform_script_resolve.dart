import 'dart:io';

import 'subdir/somelib.dart' as lib;

void main() {
  print(Platform.script.resolve(''));
  print(lib.getFileDir());
}
