library x;

import "package:unittest/unittest.dart";
import "package:unittest/mock.dart";



class TestClassMock extends Mock implements RealClass {
  RealClass _real;

  TestClassMock() {
    _real = new RealClass();

    when(callsTo("myNamedFunction")).alwaysCall(_real.myNamedFunction);
  }

  noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

class RealClass {
  String _name = "RealClass";
  Function myNamedFunction;

  RealClass() {
    myNamedFunction = _theNamedFunction;
  }

  String _theNamedFunction() {
    return _name;
  }
}

class ClassThatCallsRealClass {
  ClassThatCallsRealClass(Function func) {
    func();
  }
}

class MyFunc implements Function {

  Function func;
  String functionName;

  MyFunc(this.func, this.functionName);

  call() {
    var inv = new MyInvocation(functionName);
    func(inv);
  }
}

main(List<String> args) {
  test('xx', () {
    //The test
    TestClassMock testClassMock = new TestClassMock();
    ClassThatCallsRealClass caller = new ClassThatCallsRealClass(new MyFunc(testClassMock.noSuchMethod, "myNamedFunction"));
    testClassMock.getLogs(callsTo("myNamedFunction")).verify(happenedOnce);
  });
}

class MyInvocation extends Invocation {
  final String f;
  MyInvocation(this.f);

  bool get isGetter => false;

  bool get isMethod => true;

  bool get isSetter => false;

  Symbol get memberName => new Symbol(f);

  Map<Symbol, dynamic> get namedArguments => {};

  List get positionalArguments => [];
}