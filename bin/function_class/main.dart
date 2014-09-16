void main() {

}

abstract class A extends Function {
  int call(String x, num y);
}

abstract class B extends A {

}

class C extends B {

  int call(String x, String y) {
    return 5;
  }
}
