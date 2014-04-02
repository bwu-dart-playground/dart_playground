class MyClass {

}
class MyMixin {

}

//class x = int with MyMixin;

class y = MyClass with MyMixin;
//class z = int;

void main(List<String> args) {
  // var x = new x(50); // Mixin not allowed for int
  var i = (50 as y);
  print(i);

}