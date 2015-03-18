library base;

abstract class Base {

  Base() {
    loadDefaults();
  }

  Base.uninitialized();

  void loadDefaults() {}

  Map _values = {};

  operator [](String key) => _values[key];
}