library x;

import 'package:collection/equality.dart';

void main(List<String> args) {
  //if (const IterableEquality().equals([1,2,3],[1,2,3])) {
  if (const SetEquality().equals([1,2,3].toSet(),[1,2,3].toSet())) {
      print("Equal");
  } else {
      print("Not equal");
  }
}