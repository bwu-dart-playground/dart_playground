abstract class Mixin {
  String get someValue => 'some';

  String get otherValue => someValue;

  String get xx => toString() + 'zzz' + otherValue;

  String toString() => 'Mixin';
}

class Base extends Object with Mixin {
  String someValue = 'bla';

  String get otherValue => 'aaa';

  //String toString() => 'Base';

  String get yy => xx;
}

class App = Base with Mixin;

void main() {
  var x = new App();
  print(x.toString());
  print(x.otherValue);
  print(x.xx);
  print(x.yy);

  var y = new Base();
  print(y.yy);

  print(x);
  print(y);
}