library x;

import 'dart:io';

void main(List<String> args) {
//  stdout.write("Enter a number: ");
//  var a = stdin.readLineSync(encoding: SYSTEM_ENCODING);
//  stdout.write("Enter another number: ");
//  var b = stdin.readLineSync(encoding: SYSTEM_ENCODING);
//  stdout.write(a + b);
//
//  stdout.flush();

  stdout.write("Enter a number: ");
  stdout.flush().then((e) {
    var a = stdin.readLineSync(encoding: SYSTEM_ENCODING);
    stdout.write("Enter another number: ");
    stdout.flush().then((e) {;
      var b = stdin.readLineSync(encoding: SYSTEM_ENCODING);
      stdout.write(a + b);
    });
  });
}