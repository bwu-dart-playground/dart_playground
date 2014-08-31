
//  operator =(IntProperty val) {
//    setter(val)
//  }

/*
  The following names are allowed for user-defined operators: <, >, <=, >=,
==, -, +, /, ˜/, *, %, |, ˆ, &, <<, >>, []=, [], ˜.
   */

typedef Getter();
typedef void Setter(val);

class Property {
  Getter getter;
  Setter setter;
  Property(this.getter, this.setter);
}

typedef int IntGetter();
typedef void IntSetter(int val);

class IntProperty extends Property {
  IntProperty(IntGetter getter, IntSetter setter) : super(getter, setter);
  operator +(IntProperty val) {
    setter(getter() + val.getter());
    return this;
  }
}

class Some {
  int _x = 0;
  IntProperty _xProp;
  IntProperty get x => _xProp;
  Some([this._x = 0]) {
    _xProp = new IntProperty(() => _x, (val) => _x = val);
  }
}

void main() {
  var s = new Some();
  var t = new Some(5);
  s.x = s.x + t.x;
  print(s.x);
}
