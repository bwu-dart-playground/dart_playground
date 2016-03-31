library ng_for_map.app_element;

import 'package:angular2/core.dart'
    show Component, View, Pipe, PipeTransform;
import 'package:collection/collection.dart';
import 'dart:async';

@Component(selector: 'app-element', pipes: const [MapKeysPipe],template: '''
<h1>app-element</h1>
<table>
<tr *ngFor="#p of people">
  <td><span *ngFor="#k of p | mapKeys">{{'key|' + k + ', value|' + p[k].toString()}}</span></td>
  <td>{{ p['name'] }}</td>
  <td>{{ p['age'] }}</td>
  <td>{{ p['city'] }}</td>
</tr>
</table>
''')
class AppElement {
  List people = [
    {'name': 'Anderson', 'age': 35, 'city': 'Sao Paulo'},
    {'name': 'John', 'age': 12, 'city': 'Miami'},
    {'name': 'Peter', 'age': 22, 'city': 'New York'}
  ];
}

@Pipe(name: 'mapKeys')
class MapKeysPipe extends PipeTransform {
  Iterable prevKeys;
  dynamic transform(Map value, List args) {
    if (prevKeys != null &&
        value != null &&
        const UnorderedIterableEquality().equals(prevKeys, value.keys)) {
      return prevKeys;
    }
    prevKeys = value.keys;
    return prevKeys;
  }
}

Future x() {
  Future.forEach()
}
