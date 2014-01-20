library operator_lib;


void main(List<String> args) {
  var x = new X1();
  var y = new X1();
  assert(x != y);
  assert(x == x);
  assert(y == y);
  print(x != y);
  print(x == x);
  print(y == y);
  
}

class X1 {
  operator ==(X1 other)  {
    return identical(this, other);
    //return !identical(this, other);
  }
}