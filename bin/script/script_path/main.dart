import 'dart:io' as io;

main() {
  Uri filePath = io.Platform.script.resolve("../../../packages/playground/some_json/test.json");
  var file = new io.File.fromUri(filePath);
  var content = file.readAsString().then((c) {
    print(c);
  });
}
