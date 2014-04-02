import 'dart:collection';

class MyLinkedListEntry<T> extends LinkedListEntry {
  T value;
  MyLinkedListEntry(this.value);
  @override
  String toString() => '${super.toString()}: ${value}';
}

void main(List<String> args) {
  var l = new LinkedList();

  var s = new MyLinkedListEntry<String>("SomeString");
  l.add(s);
  s.insertAfter(new MyLinkedListEntry<int>(125));

  l.forEach((e) => print(e));
}