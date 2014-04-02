library x;

import 'dart:io';
import 'dart:async';
import 'dart:convert';

void main(List<String> args) {

  // see http://stackoverflow.com/questions/21269769

  print('somecrap\naölsdkjfölsakdjfölsj\naölsjfölksajfölaslkfdj\n');
  new Timer(new Duration(seconds: 1), () {
    print("\x1B[2J\x1B[0;0Hxxx");
  });
//    for(int i = 0; i < stdout.terminalLines; i++) {
//      stdout.writeln();
//    }
//    if(Platform.isWindows) {
//      ProcessResult pr = Process.runSync("cls", [], runInShell: true);
//      print(pr.stdout);
//
////        .then((Process p) {
////        p.stdout.listen((stdOut) => stdout.add(stdOut));
////        print('press enter');
////      });
//    } else {
//      print(Process.runSync("clear", [], runInShell: true).stdout);
      //print(pr.stdout);
      //stdout.add(pr.stdout);
//        .then((Process p) {
//        p.stdout.listen((stdOut) => stdout.add(stdOut));
//      }).then((v){
        //print('v: $v');
        //stdin.readLineSync();
      //});
//    }
//  });

}