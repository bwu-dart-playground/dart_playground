//main() {
//  add(i) => i + 2; //I intentionally deleted 'return'
//  print(add(3));
//}

//main() {
//  makeAdder(num addBy) {
//    (num i) {
//      addBy + i; //I intentionally deleted 'return'
//    };
//  }
//
//  var add2 = makeAdder(2);
//  print(add2(3) );
//}


main() {
  //foo() => 1;
  //print(foo());

  foo() { return () => 1;}
  print(foo()());
}
