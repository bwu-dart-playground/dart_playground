library x;

void main(List<String> args) {
  int i = 15;
  String s = 'SomeString-$i';
  print('xxx: ${s.toLowerCase().contains("g-1".toLowerCase())}');

  var x = new X();
  var y = new Y();

//  print(x.runtimeType == xb.runtimeType);


}

class X {

}

class Y {

}

class Z extends X {

}