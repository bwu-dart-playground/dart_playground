library so35392602_array_change_detection.app_element;

import 'package:angular2/core.dart'
    show
        Component,
        View,
        Input,
        Output,
        ChangeDetectorRef,
        ApplicationRef,
        ChangeDetectionStrategy;
import 'package:observe/observe.dart' show toObservable;

@Component(
    selector: 'app-element' //, changeDetection: ChangeDetectionStrategy.OnPush
,template: '''
<h1>app-element</h1>
<input type="text" #item>
<button (click)="addItem(item.value)">add</button>     <button (click)="update()">update</button>
<div>{{arr}}</div>

''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {
//  ChangeDetectorRef _cdRef;
//  ApplicationRef _appRef;
  AppElement(/*this._cdRef, this._appRef*/) {
//    _cdRef.detach();
  }

  List<String> arr = toObservable([]) as List<String>;
  void addItem(String value) {
    print(arr);
    arr.add(value);
//    _cdRef.markForCheck();
//    _appRef.tick();
//    _cdRef.detectChanges();
  }

  void update() {
    arr = arr.toList();
  }
}
