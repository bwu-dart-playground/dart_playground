import 'dart:math';

void main() {
  Stopwatch sw = new Stopwatch();
  sw.start();

  // possibles holds all the possible options. (1296 options in this case)
  List<List<int>> possibles;
  int size = 9; // This should be the size of each list. This is what I'm asking about.
  int maxNum = 6; // The numbers should go from 0 - maxNum.

  int resultCount = pow(maxNum, size);
  print(resultCount);
  possibles = new List(resultCount);

  List<int> cur = new List<int>(size);
  for(int i = 0; i < size; i++) cur[i] = 0;

  int cnt = 0;

  while(cur[0] < maxNum) {
    possibles[cnt] = new List.from(cur);
    cnt++;

    int pos = size-1;
    cur[pos]++;
    bool overrun = cur[pos] >= maxNum;
    while(overrun && size > 0 && pos > 0) {
      cur[pos] = 0;
      pos--;
      cur[pos]++;
      overrun = cur[pos] >= maxNum;
    }
  }

  sw.stop();
  print('elapsed: ${sw.elapsed}');

  // Print all the numbers to show it works.
//  possibles.forEach(print);
}