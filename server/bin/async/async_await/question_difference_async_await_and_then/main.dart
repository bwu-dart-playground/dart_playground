import 'dart:async';

main() async {
  Future foo(int a1, int a2) {
    print("from foo: $a1 $a2");
    return new Future.value();
  }

  int a = 0;

  await foo(a++, a++);
  print("after await foo: $a");

  a = 0;
  foo(a++, a++).then((_) {
    print("after foo.then: $a");
  });
}
