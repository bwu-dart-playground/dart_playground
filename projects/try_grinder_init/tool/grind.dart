import 'package:grinder/grinder.dart';

main(args) => grind(args);

@Task()
init() {
  log('perform init tasks...');
}

@DefaultTask()
@Depends(init)
build() {
  Pub.build();
}

@Task()
clean() => defaultClean();
