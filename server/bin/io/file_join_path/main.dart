library x;

import 'dart:io';
import 'package:path/path.dart' as path;

void main(List<String> args ) {
  Directory root = new Directory(path.current);
  String relativePath = 'testdir/some_file.txt';
  String filePath = path.join(root.path, relativePath);
  File f = new File(filePath);
  f.length().then((i) => print(i));
}