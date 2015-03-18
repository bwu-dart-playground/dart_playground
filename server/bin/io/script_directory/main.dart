import 'dart:io';

void main() {
  print(Platform.script.toFilePath(windows: true));

  // or

  print(Directory.current.absolute.path);
}
