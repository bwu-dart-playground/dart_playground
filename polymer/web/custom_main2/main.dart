import 'package:polymer/polymer.dart';
import 'dart:html';
import 'app_element.dart';

void main() {
  // in reality this list is fetched from the server
  List<String> customYears = ['2010', '2011'];

  main() {
    initPolymer().then((zone) => zone.run(() {
      // code here works most of the time
      Polymer.onReady.then((_) {
        querySelector("#custom-elements").children.add(new AppElement()
          ..id = "my_custom_element"
          ..years = toObservable(customYears));
      });
    }));
  }

//  initPolymer().run(() {
//    Polymer.onReady.then((_) {
//      querySelector("#custom-elements").children.add(
//          new AppElement()
//            ..id = "my_custom_element"
//            ..years = toObservable(customYears)
//      );
//    });
//  });
}
