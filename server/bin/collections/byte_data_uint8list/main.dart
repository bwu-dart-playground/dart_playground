library x;

import 'dart:typed_data';

void main(List<String> args) {
  var buffer = new Uint8List(44);
  var view = new ByteData.view(buffer.buffer);
  print(view.lengthInBytes);

  String s = new String.fromCharCodes(buffer);
  var l = new Uint8List.fromList(s.codeUnits);
  print(new String.fromCharCodes(l));
}
