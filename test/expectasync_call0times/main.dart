library x;

import 'package:unittest/unittest.dart';
import 'dart:async';

void main(List<String> args) {
//  test('Protect call with Timer', () {
//    var cb = expectAsync(() {}, count: 1, max: 1);
//    new Timer(new Duration(seconds: 1), () {});
//  });

  test('Protect call with Timer 2', () {
    var cb = expectAsync(() {}, count: 1, max: 1);
    cb();
    new Timer(new Duration(seconds: 1), () {
      //cb();
      cb();
    });
  });

//  test('Protect call with Future', () {
//    var cb = expectAsync(() {}, count: 1, max: 1);
//    new Future.delayed(new Duration(seconds: 1),  () {});
//  });

  test('Protect call with Future', () {
    var cb = expectAsync(() {}, count: 1, max: 1);
    new Future.delayed(new Duration(seconds: 1),  () {
      cb();
      cb();
    });
  });

}