import 'dart:io' as io;

main() {
  Uri scriptPath = io.Platform.script;
  var file = new io.File("../../../packages/playground/some_json/test.json");
  var content = file.readAsString().then((c) {
    print(c);
  });
}