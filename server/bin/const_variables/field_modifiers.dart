class Foo {
  static const F0 = 'F0';
  static const F1 = 'F1';
  static const F2 = 'F2';
  // const list of const values I guess...
  static const CONST_LIST = const [F0, F1, F2]; // please explain this line
  static final String FOO = CONST_LIST[0]; // ok
  // compile error: 'const' varaibles must be constant value
  // static const String BAR = CONST_LIST[1];
}

main() {
  // is CONST_LIST const or not?
  // below line it's ok for dartanalyzer but
  // in runtime: Cannot change the content of an unmodifiable List
  Foo.CONST_LIST[1] = 'new value';
  print(Foo.CONST_LIST);
}
