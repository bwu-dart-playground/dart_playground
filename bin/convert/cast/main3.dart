import "dart:mirrors";

void main() {
  var list = new List<String>();
  //var listMirror = reflectClass(list.runtimeType);
  var listMirror = reflect(list).type.;
  // Is "List<String>" subtype of "List<String>"?

  //print(listMirror.isSubtypeOf(listMirror));
  // Method with parameter "List<String>"
  var method = (List<String> list) {};
  var closure = reflect(method) as ClosureMirror;
  var function = closure.function;
  var parameter = function.parameters.first;
  // Is "List<String>" subtype of "List<String>"?
  print(parameter.type);
  listMirror.forEach((e) => print(parameter.type.isSubtypeOf(e)));
  print(parameter.type.isSubtypeOf(listMirror));
  print(listMirror.isSubtypeOf(parameter.type));
  // Invoke method with arg: "List<String>" on param "List<String>"
  method(list);
}