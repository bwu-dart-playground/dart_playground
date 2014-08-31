class Wolf {
}

class WereWolf extends Wolf {
}

void main() {
  var a = new Wolf();
  var b = new WereWolf();
  var c = new WereWolf();
  List<Wolf> list = <Wolf>[a, b, c];

  List<WereWolf> wereList = new List<WereWolf>.from(list.where((e) => e is WereWolf));
  print(wereList);
  print(wereList.runtimeType);
}
