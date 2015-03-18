void main() {

  Stopwatch sw = new Stopwatch();
  sw.start();

  // possibles holds all the possible options. (1296 options in this case)
  List<List<int>> possibles = new List();
  int size = 4; // This should be the size of each list. This is what I'm asking about.
  int maxNum = 6; // The numbers should go from 0 - maxNum.


  List<int> cur = new List<int>(size);
  for(int i = 0; i < size; i++) cur[i] = 0;

  while(cur[0] < maxNum) {
    possibles.add(new List.from(cur));

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
  for(List<int> l in possibles) {
    //print(l);
  }
}