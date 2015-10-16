library some_library.sublib;

class MyClass {
  hello() => print('hello world');
}

class MyOtherClass<T> {
  hello() => print('hello world${T}');
}
