void main() {
  String s = 'blabla';

  s.codeUnits.forEach((f) => print(new String.fromCharCode(f)));
  s.runes.forEach((f) => print(new String.fromCharCode(f)));
}