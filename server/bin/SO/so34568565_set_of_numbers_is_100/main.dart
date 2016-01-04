void main() {
  List<List<int>> resultList1 = <List<int>>[];
	for(int i1 = 1; i1 < 98; i1++)	{
    for(int i2 = 1; (i1 + i2) < 99; i2++) {
      for(int i3 = 1; (i1 + i2 + i3) < 100; i3++) {
        for(int i4 = 1; (i1 + i2 + i3 + i4) <= 100; i4++) {
          if((i1 + i2 + i3 +i4) == 100) {
          	resultList1.add([i1, i2, i3, i4]);
          }
        }
      }
    }
  }
//  print(resultList1);
  print(resultList1.length);
  final int elementCount = 3;
  final int target = 50;
  final List<List<int>> resultList2 = <List<int>>[];
  sum(elementCount, target, resultList2, [0, 0, 0], 0);
  print(resultList2);
  print(resultList2.length);
}

void sum(int elementCount, int target, List<List<int>> result, List<int> values,
    int curPos) {
  for (int i = values[curPos] + 1; i <= target - curPos; i++) {
    // debugging only
    if(curPos == 0) {
      print(i);
    }
    // end debugging only
    values[curPos] = i;
    if (curPos == elementCount - 1) {
      if (values.reduce((int a, int b) => a + b) == 100) {
//        print(values);
        result.add(values.toList());
      }
    } else {
      sum(elementCount, target, result, values, curPos + 1);
    }

    for(int j = curPos + 1; j < values.length; j++) {
      values[j] = 0;
    }
  }
}
