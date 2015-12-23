//import 'package:angular2/core.dart';
import 'package:angular2/bootstrap.dart';
import 'package:angular2_hero_router/app_component.dart';
import 'package:angular2/router.dart' show ROUTER_PROVIDERS;
import 'package:angular2_hero_router/dialog_service.dart';
import 'package:angular2_hero_router/heroes/hero_service.dart';

void main() {
//  enableProdMode();
  bootstrap(AppComponent, [ROUTER_PROVIDERS, DialogService, HeroService]);
}
