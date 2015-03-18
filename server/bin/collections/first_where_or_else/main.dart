void main() {
  checkOrElse(['bar', 'bla']);
  checkOrElse(['bar', 'bla', 'foo']);


}

void checkOrElse(List<String> values) {
  String result = values.firstWhere((o) => o.startsWith('foo'), orElse: () => '');

  if (result != '') {
    print('found: $result');
  } else {
    print('nothing found');
  }
}
