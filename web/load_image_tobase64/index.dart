import 'dart:html';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';


main() {
  HttpRequest.request(
      "http://37.139.24.217/images/3b4130fa05294cd2af0624b8826c4425_1406120258.png",
      responseType: "arraybuffer").then((HttpRequest response) {
    String contentType = response.getResponseHeader('Content-Type');

    var list = new Uint8List.view((response.response as ByteBuffer));

    String header = 'data:$contentType;base64,';
//    String base64 = CryptoUtils.bytesToBase64((response.response as ByteBuffer).asUint8List());
    String base64 = CryptoUtils.bytesToBase64(list);
    String image = "${header}${base64}";

    //  me.avatar = image;
    print(image);
    //}
  });
}
