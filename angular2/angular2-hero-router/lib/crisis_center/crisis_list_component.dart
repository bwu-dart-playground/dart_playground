import 'package:angular2/core.dart' show Component, OnInit;
import 'crisis_service.dart' show Crisis, CrisisService;
import 'package:angular2/router.dart' show Router, RouteParams;

@Component(
  template: r'''
    <ul>
      <li *ngFor="#crisis of crises"
        [class.selected]="isSelected(crisis)"
        (click)="onSelect(crisis)">
        <span class="badge">{{crisis.id}}</span> {{crisis.name}}
      </li>
    </ul>
  '''
)
class CrisisListComponent implements OnInit {
  List<Crisis> crises;
  String _selectedId;

  CrisisService _service;
  Router _router;

  CrisisListComponent(
    this._service,
    this._router,
  RouteParams routeParams ) {
      _selectedId = routeParams.get('id');
  }

  void ngOnInit() {
    _service.getCrises().then((crises) => this.crises = crises);
  }

  bool isSelected(Crisis crisis) => crisis.id == _selectedId;

  void onSelect(Crisis crisis) {
    _router.navigate( ['CrisisDetail', { 'id': crisis.id }]  );
  }
}
