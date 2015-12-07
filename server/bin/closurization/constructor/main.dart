//class C {
//  C.m() {}
//}
//
//main() {
//  print(identical(C, C)); // prints true
//  print(new C#m);
//  print(new C#m == new C#m); // prints false
//}


void main() {
  var constructor = new SomeClass#someConstructor;
  var x = constructor();

  print(dateConstructor(isUtc: true)(2000,1,1));
  print(dateConstructor(isUtc: false)(2000,1,1));
}

Function dateConstructor({bool isUtc}) {
  if(isUtc) {
    return new DateTime#utc;
  } else {
    return new DateTime#;
  }
}

class SomeClass {
  SomeClass.someConstructor() {
    print('constructing...');
  }
}

