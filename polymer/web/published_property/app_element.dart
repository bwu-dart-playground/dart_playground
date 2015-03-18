import 'dart:async' as async;
import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  AppElement.created() : super.created() {
    writeValue(#counter, '00:00');
  }

//  String _counter = '00:00';
//  @PublishedProperty(reflect: true)
//  String get counter => _counter;
//  void set counter (String s){
//    _counter = s;
//    print('update s: $s');
//  }

  @PublishedProperty(reflect: true)
  String get counter => readValue(#counter);
  void set counter (String s){
    writeValue(#counter, s);
    print(counter);
  }

  void attached() {
    new async.Timer.periodic(new Duration(seconds:1), (_) {
      //var oldVal = _counter;
      var time = new DateTime.now();
      counter = '${time.minute}:${time.second}';
      //notifyPropertyChange(#counter, oldVal, _counter);
    });
  }

}

/*
I think I know what the problem is. When you have a getter and change the value the getter forwards to, the `@published`, `@PublishedProperty(reflect: true)` doesn't have any effect because `counter` is observed but not `_counter`.

 */
