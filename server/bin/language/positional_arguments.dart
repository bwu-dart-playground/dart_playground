void main(args) {
  doSomething(5, opt = 10);
}

void doSomething(int x, [opt = 5]) {
  print(opt);
}