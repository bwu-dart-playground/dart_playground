class A {

}
class B<T extends A> {
  test(Type a) {
    print('${T == A}');
    print('${T == a}');
  }
}

void main() {
  new B<A>().test(A);
}
