import 'dart:async';

Stream<int> a() async* {
  for (int i = 1; i <= 10; ++i) {
    print('yield $i');
    yield i;
  }
}

main() {

  a().listen((e) async {
    await new Future.delayed(const Duration(seconds: 1));
    print('1: $e');
  });

  StreamSubscription sub;
  sub = a().listen((e) async {
    sub.pause();
    await new Future.delayed(const Duration(seconds: 1));
    print('2: $e');
    sub.resume();
  });
}
