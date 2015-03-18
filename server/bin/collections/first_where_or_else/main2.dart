void main() {
  final l = ['a', 'b', 'c', null];
  final r = l.firstWhere((e) => e == null, orElse: () => null);
  if(r == null) {
    print('null');
  } else {
    print('r');
  }
}
