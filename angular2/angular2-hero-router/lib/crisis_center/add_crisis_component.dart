import 'package:angular2/core.dart' show Component;
import 'crisis_service.dart' show Crisis, CrisisService;
import 'package:angular2_hero_router/dialog_service.dart' show DialogService;
import 'package:angular2/router.dart'
    show CanDeactivate, ComponentInstruction, Router;

@Component(
    template: r'''
  <h2>"{{editName}}"</h2>
  <div>
    <label>Name: </label>
    <input [(ngModel)]="editName" placeholder="name"/>
  </div>
  <button (click)="save()">Save</button>
  <button (click)="cancel()">Cancel</button>
  ''',
    styles: const ['input {width: 20em}'])
class AddCrisisComponent implements CanDeactivate {
  String editName;

  CrisisService _service;
  Router _router;
  DialogService _dialog;

  AddCrisisComponent(this._service, this._router, this._dialog);

  bool routerCanDeactivate(
      ComponentInstruction next, ComponentInstruction prev) {
    return editName.trim().isNotEmpty
        ? editName.trim()
        : _dialog.confirm('Discard changes?');
  }

  void cancel() {
    this.gotoCrises();
  }

  void save() {
    this._service.addCrisis(this.editName);
    this.gotoCrises();
  }

  void gotoCrises() {
    this._router.navigate(['CrisisCenter']);
  }
}
