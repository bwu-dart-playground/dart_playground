class C {
  F f;
}

typedef String F(C c);

void main() {
  Map<String, F> functions = <String, F>{};
  functions.putIfAbsent("hello", () => (C c) => "a");

  for (var key in functions.keys) {
    functions[key]();
  }
}
