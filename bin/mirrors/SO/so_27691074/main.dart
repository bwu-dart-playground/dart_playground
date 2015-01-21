import 'dart:mirrors';

class Animal {
}

class Duck extends Animal {
}

class Lama extends Animal {
}

//Zoo myZoo;

class Zoo {
  Park<Duck> ducks;
  Park<Lama> lamas;
}

class Park<E extends Animal> {

}

void main() {
  ClassMirror cm = reflectClass(Zoo);
  cm.declarations.forEach((k, v) {
    if(v is VariableMirror) {
      if ((v as VariableMirror).type.typeArguments.where((t) => t.isSubtypeOf(reflectType(Animal))).length > 0) {
        print('$k, $v');
      }
    }
  });
}
