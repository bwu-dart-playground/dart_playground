class Country {
  final int id;
  final String name;

  static const List<Country> values = const <Country>[US, UK];

  static const Country US = const Country._create(1, 'United States');
  static const Country UK = const Country._create(2, 'United Kingdom');

  const Country._create(this.id, this.name);
}

void main() {
  print('Countries:');
  for (Country country in Country.values) {
    print(country.name);
  }

  List x = [];
  x.map((y) => y);
}
