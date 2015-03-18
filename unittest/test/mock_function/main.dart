import 'package:unittest/unittest.dart';
import 'package:mock/mock.dart';

typedef int Adder(int a, int b);

int useAdder(Adder adder) {
  return adder(1, 2);
}

@proxy
class MyMock extends Mock {
  MyMock(){
    when(callsTo('call')).alwaysCall(this.foo);
  }
  int foo(int a, int b) => a+b;

  int call(int a, int b) => super.call(a, b);

}

void main() {

  test("bb", () {
    var mockf = new MyMock();
    expect(useAdder(mockf as Adder), 3);
    mockf.getLogs(callsTo('call', 1, 2)).verify(happenedOnce);
  });
}