import "dart:io";
import 'dart:convert';

void main() {
  var sub;

  sub = stdin.transform(UTF8.decoder).transform(new LineSplitter()).listen((l) {
    if (l == "e") {
      sub.cancel();
    }
    print('$l');
  });
}
