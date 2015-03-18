import 'dart:typed_data' as td;
import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('app-element')
class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }
  attached() {
    super.attached();
    var blob = new dom.Blob([new td.Uint8List.fromList([40, 2, 0])]);
    print(blob.slice(0,3));
  }
}
