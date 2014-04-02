import 'dart:io';

main() {
   new Directory('.').watch().listen((FileSystemEvent event) {
     print(event);
   });
}