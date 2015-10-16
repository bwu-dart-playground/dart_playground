List<Object> rotate(List<Object> list, int v) {
  if(list == null || list.isEmpty) return list;
  var i = v % list.length;
  return list.sublist(i)..addAll(list.sublist(0, i));
}

main() {
  final l = [10, 20, 30, 40, 50, 60, 70, 80, 90];

  var l1 = rotate(l, 5);
  print(l1);
}
