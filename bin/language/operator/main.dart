void main() {
  x = true;
  toggle();
  print(x);

  toggle();
  print(x);

  x = null;
  toggle();
  print(x);

  print(true == true ? false : true);
  print(null == true ? false : true);


}

bool x;

bool toggle() => x = (x == true ? false : true);
