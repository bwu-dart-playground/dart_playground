import 'dart:async';

//void main() {
//  var x = concat([0, 1, 2, 3, 4], [5, 6, 7, 8, 9]);
//  print(x);
////  while(true) {
////    print(await generate());
////  }
//}
//
//concat(Iterable left, Iterable right) sync* {
//  yield* left;
//  yield* right;
//}

void main() {
  generate.listen((i) => print(i));
}

Stream<int> generate () async* {
  int i = 0;

  yield ++i;
}

//void main() {
//  print(flatMap([0, 1, 2, 3, 4, 5], (x) => [x, x]));
//}
//
//flatMap(ss, f) sync* {
//  for (var s in ss) yield* f(s);
//}


//void main() {
//  var x =map([0, 1, 2, 3, 4, 5], (x) => x.isEven);
//  print(x);
//}
//
//map(ss, f) sync* {
//  for (var s in ss) {
//    if(f(s)) {
//      yield s;
//      yield s+1;
//    }
//  }
//}


//void main() {
//  print(range(0, 10));
//}
//
////range(start, count) sync* {
////  if (count <= 0) return;
////  yield start;
////  yield* range(start + 1, count - 1);
////}
//
//range(start, count) sync* {
//  if (count <= 0) return;
//  while(count-- > 0) {
//    yield start++;
//  }
//}

//void main() {
//  var x = new String.fromCharCodes(reverse("123456789".codeUnits));
//  print(x);
//}
//
//reverse(Iterable source) sync* {
//  if(source.isNotEmpty) {
//    yield* reverse(source.skip(1));
//  }
//  if(source.isNotEmpty) {
//    yield source.first;
//  }
//}

//void main() {
//  try {
//    print(f());
//  } catch (e) {
//    print(e);
//  }
//}
//
//f() sync* {
//  try {
//    yield 1;
//    throw 2;
//  } catch (e) {
//    yield 3;
//    throw 4;
//  } finally {
//    yield 5;
//  }
//}

//void main() {
//  print(f());
//}
//
//f() sync* {
//  var pc = 0;
//  var i = 2;
//  switch (pc) {
//    L0: case 0:
//      yield 1;
//      continue L1;
//    L1: case 1:
//      if (i-- <= 0) return;
//      yield 2;
//      continue L0;
//  }
//  yield 3;
//}
