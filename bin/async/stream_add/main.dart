import 'dart:async';
import 'dart:collection';


class MyData extends IterableBase<int> {

  List<int> data = <int>[];

  Iterator<int> get iterator {
    return new MyDataIterator(data);
  }

  void add(int item) => data.add(item);
}

class MyDataIterator extends Iterator<int> {
  List data;
  MyDataIterator(this.data);

  int curIdx = 0;

  @override
  int get current => data[curIdx];

  @override
  bool moveNext() {
    if(data.length > curIdx +1) {
      curIdx++;
      return true;
    } else {
      return false;
    }
  }
}

var stream;
main() {
  MyData myData = new MyData();
  Stream stream = new Stream.fromIterable(myData);  // create the stream

  // subscribe to the streams events
  stream.listen((value) {       //
    print("Received: $value");  // onData handler
  });

  myData.add(1); // doesn't work as iterator is not async
}