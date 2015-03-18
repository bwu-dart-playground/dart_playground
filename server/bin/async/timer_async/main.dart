import 'dart:async' show Timer;
import 'dart:math';



void main() {
  //Recursion
  fib1(x) => x > 1 ? fib1(x-1) + fib1(x-2) : x;
  //Mathematical
  num fi = (1 + sqrt(5)) / 2;
  fib2(x) => x > 1 ? ((pow(fi, x) + pow(1 - fi, x)) / sqrt(5)).round() : x;
  //Linear
  fib3(x) {
    if(x < 2) return x;
    int a1  = 0;
    int a2  = 1;
    int sum = 0;
    for(int i = 1; i < x; i++) {
      sum = a2 + a1;
      a1 = a2;
      a2 = sum;
    }

    return sum;
  }


  Timer.run(() => print('Fib2: ${fib2(100)}'));
  Timer.run(() => print('Fib3: ${fib3(100)}'));
  Timer.run(() => print('Fib1: ${fib1(39)}'));
  print('exit');
}