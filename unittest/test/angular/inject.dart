import 'dart:async';
import 'package:angular/angular.dart';
import 'package:mock/mock.dart';
import 'package:unittest/unittest.dart';
import 'package:angular/mock/test_injection.dart';
import 'package:angular/mock/module.dart';
import 'package:di/di.dart';

void main() {
  //useHtmlConfiguration();
//  group("SetUp with future that waits", () {
//    setUp(() {
//      return new Future.value("First").then((_) => print(_));
//    });
//
//    test("Welcome to the world of tomorrow!", () {
//      print("Second");
//    });
//  });

  group("SetUp with future that doesn't wait", () {
    setUp(() {
      var done = expectAsync(() {});
      inject((Injector inject) {
        // injection causes the test to not wait
        print('xxx');
        //done();
      });
      return new Future.value("First").then((_) => print(_));
    });
    test("Welcome to the world of tomorrow!", () {
      print("Second");
    });
  });
}
