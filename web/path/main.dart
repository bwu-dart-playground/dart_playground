library x;

import 'dart:io' as io;
//import 'package:path/pa th.dart' as path;

const DST_DIR = 'build/src';

void main(List<String> args) {
  io.Directory dstDir = new io.Directory.fromUri(Uri.parse(DST_DIR));
  var p = io.Platform.script.path;
  print(p);
  //path.style // for specifying which OS's path style to use
}