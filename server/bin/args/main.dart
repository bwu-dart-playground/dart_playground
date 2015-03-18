import 'package:args/args.dart';
import 'package:args/command_runner.dart';

void main(List<String> args) {
  var parser = new ArgParser();

//  parser.addFlag("test", abbr: 't');
//  var test = parser.parse(args);
//  print(test["test"]);

  var command = new ArgParser();
  parser.addCommand('shuffle', command);

  var runner = new CommandRunner('shuffle', '')
    ..addCommand(new ShuffleCommand())
    ..run(args);

}

class ShuffleCommand extends Command {

  final name = "shuffle";
  final description = "Shuffle and choose cards from a deck";

  ShuffleCommand() {
    argParser
      ..addFlag('count', abbr: 'c', defaultsTo: true)
      ..addOption('deck');
  }

  void run() {
    print(argParser.options);
  }
}
