main() {
  print(doSomething(10));
  print(doSomething(null));
}

int doSomething([int x = 10]) {
  return x * 2;
}
