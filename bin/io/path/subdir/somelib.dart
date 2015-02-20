library somelib;

import 'dart:io';

Uri getFileDir() {
  return Platform.script.resolve('');
}
