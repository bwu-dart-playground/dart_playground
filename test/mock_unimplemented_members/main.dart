import 'package:unittest/mock.dart';

class Foo {
  int x;
  bar() => 'bar';
  baz() => 'baz';
}


class MockFoo extends Mock implements Foo {
  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  var mockFoo = new MockFoo();
  mockFoo.when(callsTo('bar')).
      thenReturn('BAR');

  print(mockFoo.bar());
}