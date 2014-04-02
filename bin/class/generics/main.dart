class ILookup<TKey, TElement> implements IEnumerable<IGrouping<TKey, TElement>> {
}

class Lookup<TKey, TElement> extends Object with Enumerable<TKey> implements ILookup<TKey, TElement> {
}

class IEnumerable<T> implements HasIterator<T> {
}

class HasIterator<T> {
}

class IGrouping<TKey, TElement> implements IEnumerable<TKey> {
}

class Enumerable<T> implements IEnumerable<T> {
}

void main() {
  var obj = new Lookup();
  print(obj);
}