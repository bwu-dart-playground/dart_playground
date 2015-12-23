import 'dart:async' show Future;
import 'package:angular2/core.dart' show Injectable;

class Hero {
  String id;
  String name;
  Hero(this.id, this.name);
}

@Injectable()
class HeroService {
  Future<List<Hero>> getHeroes() {
    return heroesPromise;
  }

  Future<Hero> getHero(String id) {
    return heroesPromise.then(
        (List<Hero> heroes) => heroes.where((Hero h) => h.id == id).first);
  }
}

List<Hero> heroes = [
  new Hero('11', 'Mr. Nice'),
  new Hero('12', 'Narco'),
  new Hero('13', 'Bombasto'),
  new Hero('14', 'Celeritas'),
  new Hero('15', 'Magneta'),
  new Hero('16', 'RubberMan')
];

Future<List<Hero>> get heroesPromise => new Future.value(heroes);
