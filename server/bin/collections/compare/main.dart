import 'dart:collection';

main() {
  var chordtypes = {
    "maj": [0, 4, 7],
    "M7": [0, 4, 7, 11],
    "m7": [0, 3, 7, 10],
    "6": [0, 4, 7, 9],
    "9": [0, 4, 7, 10, 14],
    "sus2": [0, 2, 7],
    "sus4": [0, 5, 7],
    "omit3": [0, 7],
    "#5": [0, 4, 8],
    "+7b9#11": [0, 4, 8, 10, 13, 18],
    "+9": [0, 4, 8, 10, 14]
  };


  var comparator = new MapLengthComparator();
  final map = new SplayTreeMap(comparator);
  comparator.map = map;
  map.addAll(chordtypes);
  print(map);
//  Map map;
//  final sorted = chordtypes.keys.toList()
//    ..sort((v1, v2) => chordtypes[v1].length - chordtypes[v2].length);
//  sorted.forEach((k) => print('$k: ${chordtypes[k]}'));
}

class MapLengthComparator<T> {
  SplayTreeMap map;
  MapLengthComparator([this.map]);
  int call(T a, T b) {
    print('$a $b');
    return map[a].length - map[b].length;
  }
}
