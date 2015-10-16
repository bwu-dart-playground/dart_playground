class A {
  int a;
  int b = 1;
}

main() {


  A o; // = new A();
  print(o?.a + o?.b);
}
