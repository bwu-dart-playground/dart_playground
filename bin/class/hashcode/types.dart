library x;

void main(List<String> args ) {
  Test2 test2 = new Test2();

  // This one is different?
  printHashcode(test2.type);

  // Following 2 are the same
  printHashcode(Test2);

  printHashcode(Test2);

}
void printHashcode(Type t) {
  print("$t hashcode: ${t.hashCode}");
}

class Test<T> {
  Type type = T;
}


class Test2 extends Test<Test2> {
  Test2 () {

  }
}