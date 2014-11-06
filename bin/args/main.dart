import 'package:args/args.dart';

void main(List<String> args) {
  var parser = new ArgParser();

  parser.addFlag("test", abbr: 't');
  var test = parser.parse(args);
  print(test["test"]);
}
