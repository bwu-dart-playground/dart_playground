import "dart:mirrors";

void main() {
  var stringMirror = reflectType(String);
  // Quury "List<int> get codeUnits"
  MethodMirror method = stringMirror.declarations.values
      .where((e) => e.simpleName == #codeUnits).first;

  // List<int>
  var returnType = method.returnType;
  print(returnType);

  // List
  var baseType = reflectType(List);
  print(baseType);

  // List<int> is List
  print(returnType.isSubtypeOf(baseType));
}