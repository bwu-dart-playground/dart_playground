library read_write_file_line_by_line;

import 'dart:io' show File, FileMode, RandomAccessFile, ;
import 'dart:async' show Future, Timer;

Future main() async {
  File file = new File('testfile');
  RandomAccessFile raf = file.openSync(mode: FileMode.APPEND);

  new Timer.periodic(const Duration(seconds: 2), (_) {
    raf.writeString('${new DateTime.now()}\n');
  });

  await new Future.delayed(const Duration(seconds: 1), (){});

  int readpos = 0;
  new Timer.periodic(const Duration(seconds: 2), (_) {
    raf.readIntoSync();
  });

}
