library grind;

//import 'package:stack_trace/stack_trace.dart' show Chain;
import 'package:grinder/grinder.dart';
//import 'package:grinder/grinder_files.dart';
//import 'package:archive/archive.dart';

/* optional
void main(List<String> args) {
  Chain.capture(() => _main(args), onError: (error, stack) {
    print(error);
    print(stack.terse);
  });
}

_main(List<String> args) => grind(args);
*/
@Task()
void init(GrinderContext context) => defaultInit(context);

@Task()
void clean(GrinderContext context) => defaultClean(context);

main(List<String> args) => grind(args);

/// analyze - Analyzer check excluding tests
@Task()
@Depends(init)
void build(GrinderContext context) {
   runProcess(context, 'gzip', arguments: ['argument1', 'argument2']);
  print('done');
}

