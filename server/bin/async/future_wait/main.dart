import 'dart:async' as async;
import 'dart:io' as io;

void main(args) {
  async.Future.wait([
     new io.File('file1.txt').readAsString(),
     new io.File('file2.txt').readAsString()
  ]).then((values) {
    values.forEach(print);
  });

  getFiles().then((values) {
    values.forEach(print);
  });
}

async.Future<List> getFiles() {
  return async.Future.wait([
     new io.File('file1.txt').readAsString(),
     new io.File('file2.txt').readAsString()
  ]);
}