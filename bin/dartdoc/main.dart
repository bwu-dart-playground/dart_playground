
/// [B.someMethod] ..
/// [someMethod] ..
class A {
  void someMethod() {

  }
}

/// [A.someMethod]
/// [someMethod]
class B {
  void someMethod() {

  }
}

/// [A.someMethod]
void main() {
  new A().someMethod();
}
