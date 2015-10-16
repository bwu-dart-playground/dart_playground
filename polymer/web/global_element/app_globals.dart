import 'package:polymer/polymer.dart';
import 'dart:async' show Timer;

@CustomTag('app-globals')
class AppGlobals extends PolymerElement {
  static final ObservableMap _staticValues = toObservable({});

  Map get values => _staticValues;

  AppGlobals.created() : super.created();

  ready() {
    attributes.keys.forEach((k) {
      values[k] = attributes[k];
    });

    new Timer.periodic(new Duration(seconds: 2),
        (_) => values['periodic'] = new DateTime.now());
  }
}
