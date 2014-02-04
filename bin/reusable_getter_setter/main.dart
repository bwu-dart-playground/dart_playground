library x;

class StringFieldBehaviour {
  String _value;
  var _field;

  StringFieldBehaviour(this._value, this._field);

  String call([String val]) {
    return "";
  }
}

class Foo {
  StringFieldBehaviour field;

  Foo() {
    field = new StringFieldBehaviour("defaultValue", this.field);
  }
}

void main(List<String> args) {
  var f = new Foo();
  f.field("newValue");
  print(f.field());

}