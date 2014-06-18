var m1 = {'1': '1val', '2': '2val', '3': '3val'};
var m2 = {'3': '3val2', '4': '4val', '5': '5val'};

void main(args) {
  var x = new Set.from(m1.keys)..addAll(m2.keys)..toList().sort();
  print(x);

}