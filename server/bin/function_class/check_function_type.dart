typedef String OneString(String x);
typedef String OneStringAndInt(String x, int y);

void main() {
  //var f = (String x) => '$x';
  var f = (String x, int y) => '$x$y';
  if(f is OneString) {
    print(f('bla'));
  } else {
    print(f('bla', 10));
  }
}
