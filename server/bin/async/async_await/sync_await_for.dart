library x;

import 'dart:async' show Stream;

main() async {
  await for (int i in test()) {
    print(i);
  }
}

Iterable<int> test() sync* {
  for (int i = 0; i < 10; i++) {
    yield i;
  }
}﻿