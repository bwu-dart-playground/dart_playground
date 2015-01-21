import 'dart:io' as io;
import 'dart:convert' as convert;

void main(args) {
  new io.File("file.xml").create(recursive: true).then((file) {
      file.writeAsString("äöüÄÖÜ?", mode: io.FileMode.WRITE, encoding: convert.LATIN1);
  });
}
