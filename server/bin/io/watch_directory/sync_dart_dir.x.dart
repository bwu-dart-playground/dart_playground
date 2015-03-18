library watch_files;

import 'dart:io';
import 'package:watcher/watcher.dart';
import 'package:path/path.dart' as path;

main () {
  String destination_path = '/home/zoechi/tmp/sync_dart_dir';
  DirectoryWatcher watcher = new DirectoryWatcher('/home/zoechi/source/my/dart/playground/web/_simple_web_example');

  watcher.events.listen((WatchEvent data) {
    String new_path = path.join(destination_path, path.relative(data.path, from: '/home/zoechi/source/my/dart/playground/web'));
    print('${data.type} ${data.path} => $new_path');

    if (data.type == ChangeType.REMOVE) {
      deleteFile(new_path);
    } else {
      copyFile(data.path, new_path);
    }
  });

  watcher.ready.then((_) {
    print('Watching started on ${watcher.directory}');
  });
}

copyFile(String file, String destination) {
  Directory dir = new Directory(path.dirname(destination));
  dir.create(recursive:true)
  .then((_) => new File(file).copy(destination))
  .catchError((_) {
    print(_);
  });
}

deleteFile(String filename) {
  File file = new File(filename);

  file.exists()
  .then((bool exists) =>
    exists ?
    file.delete(recursive:true) :
    null)
  .catchError((_) {
    print(_);
  });
}
