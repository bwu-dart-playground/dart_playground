import 'dart:html' as dom;
import 'dart:typed_data' as td;

main () {

  var b = new td.Uint8List.fromList("xxx".codeUnits).buffer;
  new String.fromCharCodes(b.asInt8List());

  dom.window.onMessage.listen((dom.MessageEvent e) {
    //e.
  });
  //dom.window.postMessage('bla', )
}

