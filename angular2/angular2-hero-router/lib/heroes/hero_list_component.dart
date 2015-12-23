// TODO SOMEDAY: Feature Componetized like HeroCenter
import 'dart:async' show Future;
import 'package:angular2/core.dart' show Component, OnInit;
import 'hero_service.dart' show Hero, HeroService;
import 'package:angular2/router.dart' show Router;

@Component(
  template: r'''
    <h2>HEROES</h2>
    <ul>
      <li *ngFor="#hero of heroes"
        (click)="onSelect(hero)">
        <span class="badge">{{hero.id}}</span> {{hero.name}}
      </li>
    </ul>
  '''
)
class HeroListComponent implements OnInit {
  List<Hero> heroes;
  Hero selectedHero;

  Router _router;
  HeroService _service;

  HeroListComponent(
    this._router,
    this._service);

  Future<Null> ngOnInit() async {
    heroes = await _service.getHeroes();
  }

  void onSelect(Hero hero) {
    this._router.navigate( ['HeroDetail', { 'id': hero.id }] );
  }
}

/* A link parameters array
// #docregion link-parameters-array
['HeroDetail', { id: hero.id }] // {id: 15}
// #enddocregion link-parameters-array
*/
