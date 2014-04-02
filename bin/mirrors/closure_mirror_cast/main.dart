import 'dart:mirrors';

class A {
}

main() {
  doSomething(reflect(main));
  doSomething(reflect(A));
  doSomething(reflect(A).type);
}

void doSomething(x) {
  if(x is ClosureMirror) print('ClosureMirror: ${(x as ClosureMirror).function}');
  else if(x is InstanceMirror) print('InstanceMirror: ${(x as InstanceMirror).type.simpleName}');
  else if(x is ClassMirror) print('ClassMirror: ${(x as ClassMirror).simpleName}');
  else print('else: ${x.runtimeType}');
}