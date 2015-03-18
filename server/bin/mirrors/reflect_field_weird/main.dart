import 'dart:mirrors';

typedef T1 getterField<T1, T2>(T2);

typedef T1 someTypedef<T1, T2>(T2);



class A {
  String _name;
  String get name => _name;
  set name(String n) {
    print("setting name to " + n);
    _name = n;
  }
  static final getterField<String, A> nameField = (A a) {
    return a.name;
  };
}

void main() {
  A a = new A();
  a.name = "Paul";

  InstanceMirror m = reflect(A.nameField);
  ClosureMirror c = m;
  var cm = reflectClass(A);
  List types = (cm.declarations[#nameField] as VariableMirror).type.typeArguments;
  print(types);


  someTypedef nf = A.nameField;

  // Warning given for the following line (as expected):
  // A value of type 'String' cannot be assigned to a variable
  // of type 'int'
  // num i = A.nameField(a);
}