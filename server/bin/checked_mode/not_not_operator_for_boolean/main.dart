main() {
  var foo = new Foo();
  foo.writeValue(true);
  print('true: ${foo.value}');
  foo.writeValue(false);
  print('false: ${foo.value}');
  //foo.writeValue(null);  // boolean expression must not be null
  //print('null: ${foo.value}');
  //foo.writeValue(''); // type 'String' is not a subtype of type 'bool' of 'boolean expression'.
  //print('"": ${foo.value}');
  //foo.writeValue('x'); // type 'String' is not a subtype of type 'bool' of 'boolean expression'.
  //print('"x": ${foo.value}');
}

class Foo {
  bool value;

  writeValue(dynamic value) {
  	this.value = !!value;
  }
}
