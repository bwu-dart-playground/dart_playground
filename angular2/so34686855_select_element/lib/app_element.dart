library so34686855_select_element.app_element;

import 'dart:html' show Event, OptionElement, SelectElement;
import 'package:angular2/angular2.dart'
    show
        Component,
        Directive,
        EventEmitter,
        FORM_DIRECTIVES,
        Input,
        NgFor,
        OnChanges,
        Output,
        SimpleChange,
        View;

@Component(selector: 'app-element',
    templateUrl: 'app_element.html',
    directives: const [FORM_DIRECTIVES, NgFor]) // OptionValue,
class AppElement {
  @Input() List<Hero> heros = [
    new Hero()
      ..id = '1'
      ..name = 'hero1',
    new Hero()
      ..id = '2'
      ..name = 'hero2',
    new Hero()
      ..id = '3'
      ..name = 'hero3'
  ];
  @Output() EventEmitter selectedHeroChange = new EventEmitter();
  @Input() Hero selectedHero;

  String get title => selectedHero?.name;

  void onHeroChange(Event event) {
    Hero hero = heros.firstWhere(
        (Hero hero) => hero.id == (event.target as SelectElement).value);
    // Hero hero = heros[int.parse((event.target as SelectElement).value)];
    selectedHero = hero;
    selectedHeroChange.add(hero);
  }
}

class Hero {
  String id;
  String name;
}
