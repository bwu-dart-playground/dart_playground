library b;

import 'a.dart';

class B extends A {
  B() : super();

  B.uninitialized() : super.uninitialized();

  @override
  void loadDefaults() {
    _values.addAll(_defaults);
    super.loadDefaults();
  }

  Map _defaults = {
    'g': 'gVal',
    'h': 'hVal',
    'i': 'iVal',
    'j': 'jVal'
  };

  Map _values = {};

  @override
  operator [](String key) {
    if(_values.containsKey(key)) {
      return _values[key];
    }
    return super[key];
  }
}