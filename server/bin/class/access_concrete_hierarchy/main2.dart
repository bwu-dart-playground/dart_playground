import 'b.dart';

void main(args) {
  B settings = new B();

  print(settings['b']); // should print 'bVal' but prints 'null'
  print(settings['g']); // prints 'gVal'
}