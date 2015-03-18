//import 'dart:io' as io;
//
//int old_start = 0;
//int old_length = 0;
//String content = 'abcdefg';
//String filename = 'testfile.txt';
//
//void main() {
//  final file = new io.File(filename);
//  file.createSync(recursive: true);
//  io.RandomAccessFile raf = file.openSync(mode: io.FileMode.WRITE);
//  int start_at = old_start + old_length;
//  int length = content.length;
//  print('start_at: $start_at');
//  print('length: $length');
//  raf.setPositionSync(start_at);
//  raf.writeStringSync("${filename} ${start_at} ${length}\n");
//  raf.closeSync();
//}

import "dart:io";

void main() {
  String content = "Hello world !";
  int old_start = 0;
  int old_length = 0;
  int start_at = old_start + old_length;
  int length = content.length;
  File test_file = new File("test_file");
  if (!test_file.existsSync()) {
    test_file.createSync();
  }
  RandomAccessFile raf = test_file.openSync(mode: FileMode.WRITE);
  raf.setPositionSync(start_at);
  raf.writeStringSync("test_bug ${start_at} ${length}\n");
  raf.closeSync();
}
