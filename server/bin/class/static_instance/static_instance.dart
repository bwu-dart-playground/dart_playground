void main(args) {
  var x = new GenericClass<ParentClass>();
  print(x.zero());

}

abstract class ParentClass{
  static ParentClass zero(){return null;}
}

class ChildClass extends ParentClass{
  static ChildClass zero() => new ChildClass(0);
  ChildClass(int n){
    //do something
  }
}

class GenericClass<T extends ParentClass> {
  T zero = T.zero();
}