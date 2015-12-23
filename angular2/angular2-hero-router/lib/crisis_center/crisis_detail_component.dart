import 'package:angular2/core.dart' show Component, OnInit;
import 'package:angular2/router.dart' show RouteParams, Router, CanDeactivate, ComponentInstruction;
import 'crisis_service.dart' show Crisis, CrisisService;
import 'package:angular2_hero_router/dialog_service.dart' show DialogService;


@Component(
  template: r'''
  <div *ngIf="crisis">
    <h3>"{{editName}}"</h3>
    <div>
      <label>Id: </label>{{crisis.id}}</div>
    <div>
      <label>Name: </label>
      <input [(ngModel)]="editName" placeholder="name"/>
    </div>
    <button (click)="save()">Save</button>
    <button (click)="cancel()">Cancel</button>
  </div>
  ''',
  styles: const ['input {width: 20em}']
)
class CrisisDetailComponent implements OnInit, CanDeactivate {

  Crisis crisis;
  String editName;

  CrisisService _service;
  Router _router;
  RouteParams _routeParams;
  DialogService _dialog;

  CrisisDetailComponent(
    this._service,
    this._router,
    this._routeParams,
    this._dialog
    );

  void ngOnInit() {
    final String id = _routeParams.get('id');
    _service.getCrisis(id).then((Crisis crisis) {
      if (crisis != null) {
        editName = crisis.name;
        crisis = crisis;
      } else { // id not found
        gotoCrises();
      }
    });
  }

  bool routerCanDeactivate(ComponentInstruction next, ComponentInstruction prev) {
    // Allow navigation (`true`) if no crisis or the crisis is unchanged.
    // Otherwise ask the user with the dialog service and return its
    // promise which resolves true-or-false when the user decides
    return crisis != null ? crisis :
    (crisis.name == editName ? crisis.name :
           _dialog.confirm('Discard changes?'));
  }

  void cancel() {
    editName = crisis.name;
    gotoCrises();
  }

  void save() {
    crisis.name = editName;
    gotoCrises();
  }

  void gotoCrises() {
    final List route =
      ['CrisisList',  {'id': crisis?.id} ];

    this._router.navigate(route);
  }
}
