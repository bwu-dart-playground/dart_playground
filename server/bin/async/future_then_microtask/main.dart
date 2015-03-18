import "dart:async";
void main(args) {
  new Future(() {
    scheduleMicrotask(() => print("before loop 1"));
    print("in event loop 1");
  }).then((_) {
    scheduleMicrotask(() => print("before loop 2"));
    print("in event loop 2");
  }).then((_) {
    scheduleMicrotask(() => print("before loop 3"));
    print("in event loop 3");
  });

  new Future(() {
    scheduleMicrotask(() => print("before loop 1"));
    print("in event loop 1");
  }).then((_) {
    scheduleMicrotask(() => print("before loop 2"));
    print("in event loop 2");
  }).then((_) {
    scheduleMicrotask(() => print("before loop 3"));
    print("in event loop 3");
  });

}