import 'dart:io' as io;
import 'dart:convert' show UTF8;

void main() {
  io.stdin.echoMode = false;
  var input;
  while(input != 32) {
    input = io.stdin.readByteSync();
    if(input != 10)  print(input);
  }
  io.stdin.echoMode = true;
}

