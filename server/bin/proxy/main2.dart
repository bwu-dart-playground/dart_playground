class A{
  noSuchMethod(Invocation inv) => "no problems";
}

@proxy
class B{
  noSuchMethod(Invocation inv) => "no problems";
}

void main() {
  A a = new A();
  B b = new B();

  a.something; // warning
  b.something; // no warning
}
