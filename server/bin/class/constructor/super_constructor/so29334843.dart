abstract class A {
  void doSomething() => print('Do something..');
  factory A() => new B();
  A.protected();
}

class B implements A {
  @override
  void doSomething() => print('Do something already..');
}

class C extends A {
  C() : super.protected();
}

void main() {
  new C().doSomething();
}
