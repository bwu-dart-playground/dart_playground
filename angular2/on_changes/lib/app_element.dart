library on_changes.app_element;

import 'package:angular2/angular2.dart'
    show Component, EventEmitter, HostListener, Input, OnChanges, OnInit, Output, SimpleChange, View;
import 'dart:async' show Timer;
import 'dart:math' show Random;

@Component(selector: 'app-element')
@View(templateUrl: 'app_element.html' ,
    directives: const [SubComponent]
    )
class AppElement implements OnInit {

//  @Output('fixed-change')EventEmitter fixedChanged = new EventEmitter();
  bool fixed = true;

  Random _rnd = new Random();
  Timer _timer;
  void ngOnInit() {
    _timer = new Timer.periodic(
        const Duration(milliseconds: 1700), (_) {
//      fixed = _rnd.nextDouble() > 0.5;
//      fixed = false;
//      fixedChanged.add(fixed);
//      print('app $fixed');
    });
  }
}

@Component(selector: 'sub-component')
@View(template: '<div>sub-component <span>{{fixed}}</span></div>')
class SubComponent implements OnChanges, OnInit {
  @Output('fixed-change')EventEmitter fixedChanged = new EventEmitter();
  @Input() bool fixed;

  @override
  void ngOnChanges(Map<String, SimpleChange> changes) {
    print('sub: ${changes}');
  }

  Random _rnd = new Random();
  Timer _timer;

  @override
  void ngOnInit() {
    _timer = new Timer.periodic(
        const Duration(milliseconds: 1300), (_) {
//      fixed = true;
      fixed =_rnd.nextDouble() > 0.5;
      fixedChanged.add(fixed);
      print('sub $fixed');
    });

  }
}