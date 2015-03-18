import 'dart:async';

Iterable<int> a() sync* {
  for (int i = 1; i <= 10; ++i) {
    print('yield $i');
    yield i;
  }
}

void main() {
  var b = a();
  //print(b);
  var iter = b.iterator;
  Future.doWhile(() {
    return new Future.delayed(new Duration(milliseconds: 500), () {
      if(iter.moveNext()) {
        print(iter.current);
        return true;
      }
      return false;
    });
  });
}

