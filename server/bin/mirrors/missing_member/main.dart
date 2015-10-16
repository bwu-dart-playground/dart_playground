import 'dart:mirrors';
import 'dart:async' show Future, Stream;

void main() {
  var m = reflectType(Stream).instanceMembers;
  print(m);
}
