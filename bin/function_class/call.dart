class PconstClass {
  final value;
  PconstClass(this.value);
  PconstClass call(value) => new PconstClass(value);

  String toString() => "Pconst($value)";
}


void main() {
  var test = new PconstClass(10);
  // works // Breaking on exception: Class '_Type' has no instance method 'call'.

  print("Hello, $test");
}