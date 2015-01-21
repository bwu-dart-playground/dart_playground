void main(args) {
  //var m = [1,2,3].map((e) => e*2 );
  //print(m);

  Map m = {'1': 1, '2':2 };
  var newMap = new Map.fromIterable(m.keys, key: (k) => k , value: (k) => m[k] * 5 );
  new Map.f
  print(newMap);
  //<String,int>.
}
