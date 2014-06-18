class A {
  var a;
  var b;
  var c;
}

class B {
  var d;
  var e;
  var f;
}

void main() {
  var x = new Map<A,B>();
  x = new Map<B, A>();
  x = new A();

}

