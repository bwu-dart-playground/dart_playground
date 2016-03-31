library so34877364_ngif_with_directive.app_element;

import 'package:angular2/angular2.dart' show Component, ControlGroup, Directive, EventEmitter, FORM_DIRECTIVES, Injectable, Input, NgIf, Output, View;

/// Doesn't work because *ngFor is short for a wrapping `<template>` and an expression
/// on the template can't reference a directive from a child.
@Component(
    selector: 'app-element'
,
    template: '''
<h1>app-element</h1>
<button (click)="clicked()">click me</button>
<div *ngIf="isClicked">xxx</div>
''' ,
    directives: const [MyDirective]
)
class AppElement {
  MyIsClickedService service;
  AppElement(this.service);
  void clicked() => service.clicked();
}

@Directive(
    selector: 'myDirective'
)
class MyDirective {
  MyDirective(MyIsClickedService service) {
    service.isClickedChanged.listen((bool value) => isClicked = value);
  }
  @Input() bool isClicked=false;
}

@Injectable()
class MyIsClickedService {
  EventEmitter isClickedChanged = new EventEmitter();
  void clicked() => isClickedChanged.add(true);
}
