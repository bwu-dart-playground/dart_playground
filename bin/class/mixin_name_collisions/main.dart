class A {
  foo() => "A";
}
class B {
  foo() => "B";
}
class C {
  foo() => "C";
}

class Mix extends A with B, C {
  //foo() => "MIX";
  bar() => super.foo();

}

class MessABC = Object with A, B, C;
class MessBCA = Object with B, C, A;
class MessCAB = Object with C, A, B;

void main() {
  Mix mix = new Mix();
  MessABC mABC = new MessABC();
  MessBCA mBCA = new MessBCA();
  MessCAB mCAB = new MessCAB();

  print("Mix.foo = ${mix.foo()} Mix.bar = ${mix.bar()} \n"
      "mABC.foo = ${mABC.foo()} \n" "mBCA.foo = ${mBCA.foo()} \n"
      "mCAB.foo = ${mCAB.foo()} \n");



}
