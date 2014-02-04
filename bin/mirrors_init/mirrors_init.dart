import "dart:mirrors";

void main() {
  TestClass test = new TestClass();

  
  //ClassMirror m = reflectClass(TestClass).declarations[#init];
 
  
  InstanceMirror f = reflect(test);
  TestClass r = f.reflectee;
  ClosureMirror r2 = reflect(r.local);
  MethodMirror m = r2.function;
  ClosureMirror r3 = reflect(r.x);
  var r4 = r3.reflectee.runtimeType;
  
  
  //var t = reflectType(test.local);
    
  //var l = t.instanceMembers['local'];
  
  print(f);
  
//  if(m is VariableMirror) {
//    (reflect(test.init) as ClosureMirror).apply([]);
//  } else if (m is MethodMirror) {
//    reflect(test).invoke(#init, []);
//  }
//
//  var m2 = reflectClass(TestClass).declarations[#init2];
//  
//  if(m is VariableMirror) {
//    (reflect(test.init2) as ClosureMirror).apply([]);
//  } else if (m is MethodMirror) {
//    reflect(test).invoke(#init2, []);
//  }
}

class TestClass {
  Function init = () => print("hi"); 
  void init2() => print("hi");
  TestClass() {
    local(null);
  }
  var x;
  void local(x) {
    this.x = () => x;
    var y;
    () => x;
    var z = () => y;
  }
}