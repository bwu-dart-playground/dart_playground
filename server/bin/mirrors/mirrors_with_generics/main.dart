import 'dart:mirrors';

class A<T> {
  T item;
  List<T> items;
}

main() {
  var m = reflectType(new A<int>().runtimeType);

  var itemType = m.declarations[#item].type as TypeMirror;
  print('type of #item: ${itemType.qualifiedName}');  // type of #item: ClassMirror on 'int'.

  var itemsType = m.declarations[#items].type as ClassMirror;
  print('type of #items: ${itemsType.qualifiedName}');  // type of #items: ClassMirror on 'List'.

  print('type arguments of #items: ${itemsType.typeArguments.map((t) => t.qualifiedName)}');  // type arguments of #items: [TypeVariableMirror on 'T'].
}

