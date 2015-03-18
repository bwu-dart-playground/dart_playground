import 'dart:mirrors';

class MovingObject<T> {
  T _value;

  MovingObject() {
    // ???: how to init _value here?

    switch(T) {
      case int:
        _value = (5 as T);
        break;
      default:
        ClassMirror x = reflectType(T);
        _value = x.newInstance(new Symbol(''), []).reflectee;
        break;

    }
  }
}

class SomeType {
}

void main() {
  var mo1 = new MovingObject<int>();
  var mo2 = new MovingObject<SomeType>();
}