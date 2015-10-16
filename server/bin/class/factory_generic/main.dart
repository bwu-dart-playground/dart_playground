class A<T> {
  final T value;
  A.internal(this.value);

  factory A(value) {
    if (value is String) return new A.internal(value);
    else return new B(1);
  }
}


class B extends A<int> {
  B(value): super.internal(value);
}

main() {
  var a = new A('a');
  var b = new A(1);

  print(a.value);
  print(a.runtimeType);
  print(b.value);
  print(b.runtimeType);
}
