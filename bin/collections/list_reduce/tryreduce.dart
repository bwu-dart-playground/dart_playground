library x;

void main(List<String> args) {
  var l = [2,3,4,5,6];
  
  l.reduce((int a, int b) {
    print("a: $a + b: $b = ${a + b}");
    return a+b;
  });

  l.fold(0, (int a, int b) {
    print("a: $a + b: $b = ${a + b}");
    return a+b;
  });

}