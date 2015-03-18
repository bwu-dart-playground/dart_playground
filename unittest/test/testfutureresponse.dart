library x;

import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:unittest/unittest.dart';

void main(List<String> args) {
   test( "test future", (){
     test( "test future", (){
       Future<http.Response> future = http.get( "http://www.google.com");
       expect(future.then((http.Response e) => e.statusCode), completion(equals( 200 )));
      });
   });
}   
   