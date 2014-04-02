import 'dart:async';
import 'dart:math';

void main(args) {
  var f = new Future(()=>burnCpu());
  f.timeout(const Duration(seconds: 3));
}

bool signal = false;

int i = 0;
var r = new Random();

Future burnCpu() {
  if (i < 1000000) {
    i++;
    return new Future(() {
      print(i);
      for (int j = 0; j < 1000000; j++) {
        var a = (j / r.nextDouble()).toString() + r.nextDouble().toString();

      }
    }).then((e) => burnCpu());
  } else {
    return new Future.value('end');
  }
}


