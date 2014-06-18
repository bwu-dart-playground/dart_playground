void main(args) {
  print(isNumeric(null));
  print(isNumeric(''));
  print(isNumeric('x'));
  print(isNumeric('123x'));
  print(isNumeric('123'));
  print(isNumeric('+123'));
  print(isNumeric('123.456'));
  print(isNumeric('1,234.567'));
  print(isNumeric('1.234,567'));
  print(isNumeric('-123'));
  print(isNumeric('INFINITY'));
  print(isNumeric(double.INFINITY.toString()));
  print(isNumeric(double.NAN.toString()));
  print(isNumeric('0x123'));
  print(isNumeric('  3.14 \xA0'));
  print(parse('  3.14 px'));

  print(int.parse('0xab'));
  print(isNumeric('0xab'));
}

bool isNumeric(String s) {
  if(s == null) {
    return false;
  }
  return double.parse(s, (e) => null) != null ||
      int.parse(s, onError: (e) => null) != null;
}


double parse(String s) {
  if(s == null) {
    return double.NAN;
  }
  return double.parse(s, (e) => null);
}

