import 'dart:mirrors';

@proxy
class ObjectProxy implements ClassA {
  final InstanceMirror _mirror;

  ObjectProxy(Object o): _mirror = reflect(o);

  @override
  noSuchMethod(Invocation invocation){
    print('entered ${invocation.memberName}');
    var r = _mirror.delegate(invocation);
    print('returning from ${invocation.memberName} with $r');
    return r;
  }
}


class ClassA{
  int k;

  ClassA(this.k);
}

void printK(ClassA a) => print(a.k);

main() {
  ClassA a = new ObjectProxy(new ClassA(1)); //annoying
  printK(a);
}
