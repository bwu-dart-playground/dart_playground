import 'dart:async' show Future;
import 'package:angular2/core.dart' show Injectable;

class Crisis {
  String id;
  String name;
  Crisis(this.id, this.name);
}

@Injectable()
class CrisisService {
  Future<List<Crisis>> getCrises() => crisesPromise;

  Future<Crisis> getCrisis(String id) {
    return crisesPromise.then(
        (List<Crisis> crises) => crises.where((Crisis c) => c.id == id).first);
  }

  static int nextCrisisId = 100;

  void addCrisis(String name) {
    name = name.trim();
    if (name != null && name.isNotEmpty) {
      final Crisis crisis = new Crisis('${CrisisService.nextCrisisId++}', name);
      crisesPromise.then((List<Crisis> crises) => crises.add(crisis));
    }
  }
}

List<Crisis> crises = [
  new Crisis('1', 'Princess Held Captive'),
  new Crisis('2', 'Dragon Burning Cities'),
  new Crisis('3', 'Giant Asteroid Heading For Earth'),
  new Crisis('4', 'Release Deadline Looms')
];

Future<List<Crisis>> get crisesPromise => new Future.value(crises);
