library a;

import 'base.dart';

class A extends Base {
  A() : super();

  A.uninitialized() : super.uninitialized();

  @override
  void loadDefaults() {
    _values.addAll(_defaults);
    super.loadDefaults();
  }

  Map _defaults = {
    'a': 'aVal',
    'b': 'bVal',
    'c': 'cVal',
    'd': 'dVal'
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