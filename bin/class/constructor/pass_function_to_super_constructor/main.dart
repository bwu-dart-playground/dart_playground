library x;

class SuperClass {
  Function _f;
  SuperClass(this._f);
  Function get f => _f;

  void set f(Function f) { // alternative
    _f = f;                //
  }                        //
}

abstract class TextHolder {
  List<String> text;
}

class SubClass extends SuperClass implements TextHolder {
  List<String> text = [];

  factory SubClass([bool debug = false])  {
    var ad = new AddDebug(true);
    var nsc = new SubClass._internal(ad);
    ad.textHolder = nsc;

    //nsc.f = new AddDebug2(nsc.text, true); // alternative
    return nsc;
  }

  SubClass._internal(func) : super(func);
}


void main(List<String> args) {
  var x = new SubClass(true);
  x.f("sometext");
  x.f("anothertext");
  x.text.forEach((e) => print(e));
}


class AddDebug implements Function {
  bool _debug;
  AddDebug([this._debug = false]);

  TextHolder textHolder;

  call(info) {
    if(_debug) {
      textHolder.text.add(info);
    }
  }
}

// alternative
class AddDebug2 implements Function {
  bool _debug;
  AddDebug2(this._text, [this._debug = false]);

  List<String> _text;

  call(info) {
    if(_debug) {
      _text.add(info);
    }
  }
}
