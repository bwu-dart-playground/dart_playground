library x;

void main(List<String> args) {
  var list = [ 'a', 'w', ['e', ['f', new Object(), 'f'], 'g'], 't', 'e'];

  print(flatten(list));
  print(compress(list));

}


compress(List l, [List p]) => l.fold(p != null ? p : [], (List t, e) {
  if (e is String) {
    if (t.isEmpty || t.last is! String) t.add(e);
    else t.add(t.removeLast() + e);
  } else if (e is List) compress(e, t);
  else t.add(e);
  return t;
});


List flatten(List l) {
  List result = [''];
  int cur = 0;

  var add = (f) {
    if(f is String) {
      result[cur] += f;
    } else {
      result.add(f);
      result.add('');
      cur += 2;
    }
  };

  l.forEach((e) {
    if(e is List) {
      flatten(e).forEach((e) => add(e));
    } else {
      add(e);
    }
  });
  return result;
}