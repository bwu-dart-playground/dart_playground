library x;

void main(List<String> args) {
  Map map = {'key1': 'aölsjfd', 'key2': 'oiweuwrow', 'key11': 'oipoip', 'key13': 'werwr'};

  final filteredMap = new Map.fromIterable(
      map.keys.where((k) => k.startsWith('key1')), key: (k) => k, value: (k) => map[k]);
  filteredMap.forEach((k, v) => print('key: $k, value: $v'));
}