import 'dart:async' show Future;
import 'package:angular2/core.dart' show Component,  OnInit;
import 'hero_service.dart' show Hero, HeroService;
import 'package:angular2/router.dart' show RouteParams, Router;

@Component(
  template: r'''
  <h2>HEROES</h2>
  <div *ngIf="hero">
    <h3>"{{hero.name}}"</h3>
    <div>
      <label>Id: </label>{{hero.id}}</div>
    <div>
      <label>Name: </label>
      <input [(ngModel)]="hero.name" placeholder="name"/>
    </div>
    <button (click)="gotoHeroes()">Back</button>
  </div>
  '''
)
class HeroDetailComponent implements OnInit  {
  Hero hero;

  Router _router;
  RouteParams _routeParams;
  HeroService _service;

  HeroDetailComponent(
    this._router,
    this._routeParams,
    this._service);

  Future<Null> ngOnInit() async {
    final String id = this._routeParams.get('id');
    hero = await _service.getHero(id);
  }

  void gotoHeroes() {
    // <a [routerLink]="['Heroes']">Heroes</a>
    this._router.navigate(['Heroes']);
  }
}
