import 'dart:async' show Future, Stream;

// flag –enable-async

main() async {
  print(await foo());

  try {
    print(await fooThrows());
  } catch(e) {
    print(e);
  }

  await for(var v in getResults()) {
    print(v);
  }
}

foo() async => 42;

fooThrows() async => throw 'Anything';

//Stream everyOtherEvent(Stream stream) async* {
//  int i = 0;
//  stream.forEach((e) {
//    if(i.isEven) yield e; // Can't yield here, right?
//  })
//}

f() sync* {
    try {
      yield 1;
      throw 2;
    } catch (e) {
      yield 3;
      throw 4;
    } finally {
      yield 5;
    }
  }

//main() async {
//  var results = await getResults();    // This has no effect, need to write await getResults().toList();
//  print(results);
//}
