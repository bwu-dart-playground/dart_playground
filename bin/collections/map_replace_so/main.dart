void main(){
  //replace all values of instance A with an Object and all keys starting with "t" with the same key minus the "t"
  var m = {
    "one": new A(),
    "two": new A(),
    "three": new B(),
    "four": new B()
  };
  mapKeyAndValueSwapper(m,
    keyMeetsCondition: (k) => k.startsWith("t"),
    valueMeetsCondition: (v) => v is A,
    keyReplacer: (k) => k.replaceFirst("t", ""),
    valueReplacer: (v) => new Object());
  print(m);
  test();
}

mapKeyAndValueSwapper(Map m, {bool keyMeetsCondition(key), bool valueMeetsCondition(value), dynamic keyReplacer(key), dynamic valueReplacer(value)}){
  var keysToReplace = [];
  var keysToReplaceValuesFor = [];
  var keys = m.keys;
  keys.forEach((k){
    if(keyMeetsCondition != null){
      if(keyMeetsCondition(k)){
        keysToReplace.add(k);
      }
    }
    if(valueMeetsCondition != null){
      if(valueMeetsCondition(m[k])){
        keysToReplaceValuesFor.add(k);
      }
    }
  });
  keysToReplaceValuesFor.forEach((k){
    m[k] = valueReplacer(m[k]);
  });
  keysToReplace.forEach((k){
    m[keyReplacer(k)] = m.remove(k);
  });
}

class A{
  String toString() => 'A';
}
class B{
  String toString() => 'B';
}

void test2() {
  Map m = {
    "one": new A(),
    "two": new A(),
    "three": new B(),
    "four": new B()
  };


}

void test() {
  Map m = {
    "one": new A(),
    "two": new A(),
    "three": new B(),
    "four": new B()
  };


  Map newMap = {};
  m.forEach((k, v) {
    var key = k;
    var value = v;
    if(m[k] is A) {
      value = new Object();
    }
    if(k.startsWith('t')) {
      key = k.replaceFirst('t', '');
    }
    newMap[key]=value;
  });

  print(newMap);
}