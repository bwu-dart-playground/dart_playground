library x;

import 'dart:mirrors';

abstract class Junk {
  static void doSomething() {
    print("Junk.doSomething()");
  }
}
class Hamburger extends Junk {
  static bool get lettuce => true;

}
class HotDog extends Junk {
  static bool get lettuce => false;

}

Junk food; // either Hamburger or Hotdog

void main(List<String> args) {
  Junk food = new HotDog();
  findStaticAndInvoke(food, "doSomething");
  findStaticAndInvoke(food, "lettuce");

  food = new Hamburger();
  findStaticAndInvoke(food, "doSomething");
  findStaticAndInvoke(food, "lettuce");
}

void findStaticAndInvoke(o, String name) {
  ClassMirror r = reflect(o).type;
  MethodMirror sFn;
  var s = new Symbol(name);

  while (sFn == null && r != null) {
    sFn = r.staticMembers[s];
    if(sFn != null) {
      break;
    }
    r = r.superclass;
  }

  if(sFn != null) {
    if(sFn.isGetter) {
      print(r.getField(s).reflectee);
    }
    else {
      r.invoke(s, []);
    }
  }
}