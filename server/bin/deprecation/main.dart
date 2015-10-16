main() {
  new A().someMethod(10, y: 'y', z: 'z');
}

class A {
  someMethod(int x, {@Deprecated('use z') String y, String z}) {
  }
}
