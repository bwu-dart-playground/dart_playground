library x;

void main(List<String> args) {
  Map<String,String> x = { 'dart' : 'fun', 'dentist' : 'painful', };
  Map<String,String> xInv1 = x.keys.fold({}, (Map<String, String> prev, String elm) { prev[x[elm]] = elm; return prev; });

  print(xInv1);

  Map<String,String> xInv2 = x.keys.fold({}, (Map<String,String> prev, String elm) => prev..[x[elm]] = elm);
  print(xInv2);
  //Map<String,String> xInv3 = x.keys.fold({}, (prev, elm) => prev..[]=(prev[k], k));
}