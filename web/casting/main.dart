library x;

class X {

}

class Y {

}

void main(List<String> args) {
  var x = new X();

  var z = (x as Y);
  print(z);

  z = (x as X);
  print(z);
}