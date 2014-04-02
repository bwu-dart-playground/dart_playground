import 'dart:collection';

class MyIterator extends Iterator<String> {
  List<String> strings;

  int idx = -1;
  @override
  get current => strings[idx];

  @override
  bool moveNext() {
    if(idx < strings.length -1) {
      idx++;
      return true;
    }
    return false;
  }
  MyIterator(this.strings);
}

class MyClass extends Iterator<String> with IterableMixin<String> {
  List<String> strings = ['Günter', 'Gitti', 'Heidi'];
  // TODO: implement current

  get iterator => new MyIterator(strings);
}


void main(List<String> args) {
  var m = new MyClass();
  for(var s in m) {
    print(s);
  }
  print(m.elementAt(0));
}