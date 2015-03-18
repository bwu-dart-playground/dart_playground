library stream_test;

import "package:unittest/unittest.dart";
import "dart:async";

void main() {
  test("aa", () {
    StreamController streamController = new StreamController();

    Timer t;

    Stream underTest = streamController.stream;
    underTest.first.then(expectAsync((e) {
      expect(e, equals("test"));
      if (t != null) {
        t.cancel();
      }
    }));

    t = new Timer(new Duration(seconds: 3), () {
      fail('event not fired in time');
    });

    streamController.add("test");
  });
}
