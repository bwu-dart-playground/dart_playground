library x;

void main(List<String> args) {
  print(int.parse(null, onError: (e)=> 0));

//  print(int.parse("-1.35e", onError: (x) {
//    print(x);
//    return 5;
//  }).toString());
}