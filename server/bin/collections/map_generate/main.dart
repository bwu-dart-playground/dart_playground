Map f = {
  0 : 0,
  1 : 1,
  2 : 0,
  3 : 1,
  4 : 0,
  5 : 1
};

main() {
  print(new Map.fromIterable(f.values.toSet(), key: (k) => k, value: (v) => f.keys.where((k) => f[k] == v)));
  //.mapprint(f.keys.where((k) => f[k] == 0));
}
