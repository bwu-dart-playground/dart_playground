library sometest;

import "package:unittest/unittest.dart";
import "dart:async";

//http://stackoverflow.com/questions/19958625/how-does-protectasyncn-work-in-dart-unittest-package
// was macht protectAsync0??
void main() {
  test("Protect async", () {
    var done = expectAsync0(() => {});
    //var f = protectAsync0(errorProne, id: "cb_id_1");
    var f = errorProne();
    expect(f, throws);
    new Timer(new Duration(milliseconds: 1000), done);
    //expect("", equals("".substring(0, 0)));
  });
}

void errorProne() {
  new Timer(new Duration(milliseconds: 2000), () => throw "something went wrong");
  //throw "something went wrong";
}

