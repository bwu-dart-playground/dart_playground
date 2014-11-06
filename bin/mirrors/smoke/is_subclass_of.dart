import 'package:smoke/smoke.dart' as sk;

class Base {}
class Inherited extends Base {}
class A<T> {}

void main() {
  print(sk.isSubclassOf(new A<String>().runtimeType, A)); // false
  print(sk.isSubclassOf(A, A)); // true
  print(new A<String>() is A); // true

  print(sk.isSubclassOf(new A<Inherited>().runtimeType, new A<Base>().runtimeType)); // false
  print(new A<Inherited>() is A<Base>); // true

  Type t = new A<Inherited>().runtimeType;
  print(t);
}
