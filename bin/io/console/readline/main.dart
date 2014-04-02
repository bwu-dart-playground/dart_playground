library x;

import 'dart:io';

void main(List<String> args) {
  int n;
  print('input a number');
  String input = stdin.readLineSync();
  n = int.parse(input);
  print('n: $n');
  if(n < 0) {
    exit(1);
  }

  int sum = 0;
  int i = 0;

  while(i <= n) {
    print(sum);
    sum += i * i;
  }

  print(sum);
}