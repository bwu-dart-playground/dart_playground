main() {
  Stopwatch sw = new Stopwatch();
  sw.start();

  int size = 4;
  int maxNum = 6;

  // create a list of nums [0,1,2,3]
  final nums = new List.generate(maxNum, (i) => i);

  // init result with a list of nums [[0],[1],[2],[3]]
  Iterable<List> result = nums.map((i) => [i]);
  for (int i = 1; i < size; i++) {
    // every step adds a new element to the result
    // [[0],[1],...] becomes [[0,0],[0,1],[1,0],[1,1],...]
    result = result.expand((e) => nums.map((n) => e.toList()..add(n)));
  }

  int i = 0;
  result.forEach((e) {i++;});
  sw.stop();
  print(sw.elapsed);
  print(i);
  //result.forEach(print);
}