main() {
  var rbt = new Robot.fromJson({'x':21, 'y':21});
}

class Human {

}

class Robot extends Human {
  int x;
  int y;
  Robot.fromJson(Map map) : x = map['x'], y = map['y'] {
    print('Robot location is $x, $y');
  }
}
