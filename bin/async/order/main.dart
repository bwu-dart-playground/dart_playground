typedef int TestFun(int x);

class Int {
  int val;
  Int(this.val);
}

void main() {
  List<TestFun> functionList = [];

  // for normally creates a new variable for each iteration
  for (Int i = new Int(0); i.val < 10; i.val++) {
    functionList.add((int x) => x + i.val);
  }

  for (int j = 0; j < 10; j++) {
    print(functionList[j](j));
  }
}
