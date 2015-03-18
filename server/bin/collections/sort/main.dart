

void main() {
  List nlist = [4,2,1,5];
  var compare = (a, b) => a.compareTo(b);
  nlist.sort(compare);
  print(nlist);        // [1,2,4,5]

//  var nlist = [4,2,1,5]
//  var compare = (b, a) => a.compareTo(b);
//  nlist.sort(compare);
//  print(nlist);        // [5,4,2,1]
}
