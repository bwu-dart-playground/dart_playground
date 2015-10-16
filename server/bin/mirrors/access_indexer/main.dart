import 'dart:mirrors';

main() {
  final List<String> names = [ "Bob", "JOE" ];
  final InstanceMirror instanceMirror = reflect(names);
  print(instanceMirror.type.declarations);
  final Symbol function = new Symbol("[]");

  final InstanceMirror getField = instanceMirror.invoke(function,[ 1 ]);
  context = getField.reflectee;
  _logger.info("Value $context"); // Shows JOE
}
