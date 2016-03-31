library on_changes.app_element;

import 'package:angular2/angular2.dart'
    show Component, EventEmitter, HostListener, Input, OnChanges, OnInit, Output, SimpleChange, View;
import 'dart:async' show Timer;
import 'dart:math' show Random;

@Component(selector: 'app-element',templateUrl: 'app_element.html' ,
    directives: const [SubComponent]
    )
class AppElement implements OnInit {

  bool fixed = true;

  Random _rnd = new Random();
  Timer _timer;
  void ngOnInit() {
    _timer = new Timer.periodic(
        const Duration(milliseconds: 1700), (_) {
//      fixedChange.add(_rnd.nextDouble() > 0.5);
      fixed = _rnd.nextDouble() > 0.5;
      print('app $fixed');
    });
  }
}

@Component(selector: 'sub-component',template: '<div>sub-component <span>{{fixed}}</span></div>')
class SubComponent implements OnChanges, OnInit {
  @Output()EventEmitter fixedChange = new EventEmitter();
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
      fixedChange.add(_rnd.nextDouble() > 0.5);
      print('sub $fixed');
    });
  }
}
