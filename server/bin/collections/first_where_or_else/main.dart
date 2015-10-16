void main() {
  checkOrElse(['bar', 'bla']);
  checkOrElse(['bar', 'bla', 'foo']);
  checkOrElse2();

}

void checkOrElse(List<String> values) {
  String result = values.firstWhere((o) => o.startsWith('foo'), orElse: () => '');

  if (result != '') {
    print('found: $result');
  } else {
    print('nothing found');
  }
}

void checkOrElse2() {
  print(['a', 'b', 'c'].firstWhere((e) => e == 'x', orElse: () => false) == false);
}
