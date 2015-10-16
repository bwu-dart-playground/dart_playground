import 'dart:async';

Future someAsyncOperation(x) => new Future.value(x);

Future convert(thing) {
  return someAsyncOperation(thing);
}

Stream doStuff(Iterable things) {
  StreamController sc = new StreamController();
  Future
      .wait(
          things
              .map((t) => convert(t)
                  .then((value) => value != null ? sc.add(value) : null)))
      .then(
          (_) =>
              sc.close());

  return sc.stream;
}

main() {
  doStuff([1, 2, null, 3, 4, null, 5, null]).listen(print);
}
