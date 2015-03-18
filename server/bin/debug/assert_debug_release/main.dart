class X {
  X._() {
    print('x created');
  }
  factory X() {
    return new X._();
  }

  void log(String m) {
    print(m);
  }
}

bool log(String m) {
  new X()..log(m);
      return true;
}

void main() {
  assert(() => log('in Assert'));
}