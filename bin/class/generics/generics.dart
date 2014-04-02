library my_generics;

main(List<String> args) {
  var g = new Grouping<Key, Element>();
  new GroupByIterator<Source, Result, Key, Element, Grouping<Key, Element>>();
}

class Source {
  
}
class Result {
  
}

class Key {
  
}

class Element {
  
}

class Grouping<TKey, TElement> {
}



class MyClassx<T extends List<String>> {
  T listField;
  // ...
}

class MyClass<TElement, TList extends List<TElement>> {
  TList listField;
  TElement _firstListElement;
  // whatever that could be used for
}

class Iterator<TResult> {
  
}

class x<TResult> implements Iterator<TResult> {
  
  // TODO: implement current
  get current => null;

  bool moveNext() {
    // TODO: implement moveNext
  }
}

class GroupByIterator<TSource, TResult, TKey, TElement, T extends Grouping<TKey, TElement>> implements Iterator<TResult> {
  GroupByIterator() {
    print('GroupByIterator');
  }
}
//


