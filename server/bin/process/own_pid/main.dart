library x;

import 'dart:io' as io;

main() {
  print(io.Platform.script);
  print(io.Platform.executable);
  print(io.Platform.resolvedExecutable);
}
