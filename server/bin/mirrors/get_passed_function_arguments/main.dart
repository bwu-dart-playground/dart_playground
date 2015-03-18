void main() {
  argumentTest(a: 'a', b: 'b');
  print(temp);
}

Map temp = new Map();

argumentTest({String a, String b, String c: "DDD"}) {
  ({
      'a': [a, null], 'b': [b, null], 'c': [c, "DDD"]
  }).forEach((k, v) {
    if(v[0] != v[1]) temp[k] = v[0];
  });
}
