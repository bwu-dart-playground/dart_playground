void main() {
  print(myFunc.toList());
}

typedef List<String> Callback(int n);

Iterable iter = [1,2,3,4];

int fn(int x) => x * x;

List<String> get myFunc {
  return iter.map((x) => fn(x)).toList();
}
