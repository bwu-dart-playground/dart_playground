import 'dart:async';
import 'package:polymer/polymer.dart';

void main() {

  //var polymerZone = initPolymer();
  //var new Zone()
  runZoned(() => initPolymer(), onError: (e, stackTrace) {
    print('TOP ZONE: $e $stackTrace');
  });


}
