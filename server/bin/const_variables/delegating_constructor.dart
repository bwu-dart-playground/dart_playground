/*
abstract class Foo<T> {
  factory Foo(T thing) => const FooImpl(thing);
  T get thing;
}

class FooImpl<T> implements Foo<T>{
  final T thing;
  const FooImpl(this.thing);
}
*/

    abstract class Foo<T> {
      factory Foo(T thing) = FooImpl;
      T get thing;
    }

    class FooImpl<T> implements Foo<T>{
      final T thing;
      const FooImpl(this.thing);
    }

/*
see also

https://groups.google.com/a/dartlang.org/forum/#!topic/misc/cvjjgrwIHbU and
https://groups.google.com/a/dartlang.org/forum/#!topic/misc/cvjjgrwIHbU

*/
