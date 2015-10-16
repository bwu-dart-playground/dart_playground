import 'dart:html';
import 'dart:math';

final rnd = new Random();

void main() {
  //querySelector('#button').onClick.listen((e) => window.location.hash = 'xxx${rnd.nextInt(10)}');
  querySelector('#button').onClick.listen((e) => window.dispatchEvent(new HashChangeEvent('hashchange', newUrl: 'xxx${rnd.nextInt(10)}')));
  window.onHashChange.listen((e) => print('${e} ${e.type}'));
}
