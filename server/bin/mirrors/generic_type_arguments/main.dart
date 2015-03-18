import "dart:mirrors";

void main() {
  var typeArguments = [Foo, Baz];
  var mapMirror = reflectType(Map);
  // I need Map<Foo, Baz>
  // But this method missig reflectType(Type, typeArguments)
  //var mapFooBazMirror = reflectType(Map, typeArguments);

  var x = reflect(new Generic<Foo,Baz>());
  print(x.type);
  print(x.type.typeArguments);
  print(x);
}

class Generic<T,U> {

}

class Foo {
}

class Baz {
}