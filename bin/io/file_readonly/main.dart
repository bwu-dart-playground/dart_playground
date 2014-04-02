library x;

import 'dart:io';

void main(List<String> args ) {
  var file = new File("test.txt");
  print(file.absolute);
  var openFuture = file.open(mode: FileMode.READ);
  openFuture.then((raf) => raf.length().then((len) => raf.setPosition(len)
      .then((raf) => raf.writeString(("blabla\n")))));
}