library x;

abstract class AbstractThing {
  foo();
  bar();
}

class Thing extends AbstractThing{
  noSuchMethod(Invocation invocation) {
    print('NoSuchMethod');
    //super.noSuchMethod(invocation);
  }
}

void main(List<String> args) {
  new Thing().foo();
}

