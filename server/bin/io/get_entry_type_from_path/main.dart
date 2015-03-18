import 'dart:io' as io;

void main() {
  print(io.Directory.current);
  String path = '../console/readline';

  var f = new io.File(path);
  print('exists: ${f.existsSync()}');
  print('file: ${f.statSync().type == io.FileSystemEntityType.FILE}');
  print('directory: ${f.statSync().type == io.FileSystemEntityType.DIRECTORY}');
  print('link: ${f.statSync().type == io.FileSystemEntityType.LINK}');
  print('not found: ${f.statSync().type == io.FileSystemEntityType.NOT_FOUND}');
}