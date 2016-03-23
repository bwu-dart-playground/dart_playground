// http://stackoverflow.com/questions/22149085/how-to-get-the-file-if-i-know-the-root-directory-and-relative-path
library x;

import 'dart:io';
import 'package:path/path.dart' as path;

void main(List<String> args ) {
  Directory root = new Directory(path.current);
  String relativePath = '../file_join_path/testdir/some_file.txt';
  String filePath = path.join(root.path, relativePath);
  filePath = path.normalize(filePath);
  File f = new File(filePath);
  f.length().then((i) => print(i));
}
