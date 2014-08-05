library test_element;

import 'dart:async';
import 'package:polymer/polymer.dart';

class Person implements Comparable{
  String name;
  Person(this.name);

  int compare(Person p) {
    return name.compareTo(p.name);
  }

  @override
  int compareTo(Person other) {
    return name.compareTo(other.name);
  }
}

@CustomTag('test-element')
class PeopleElement extends PolymerElement {
  var people = toObservable(new List<Person>());

  PeopleElement.created() : super.created() {
    print('PeopleElement');

  }

  @override
  void attached() {
    people.add(new Person('c'));
    people.add(new Person('a'));
    people.add(new Person('f'));
    people.add(new Person('b'));

    super.attached();

    new Timer(new Duration(seconds: 3), () => sortByName());

  }

  ObservableList<Person> sortByName() {
    people.sort();
  }
}

