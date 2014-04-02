import 'dart:async';
import 'dart:html';
import 'package:unittest/unittest.dart';
import 'package:crypto/crypto.dart';
import 'package:utf/utf.dart';
var repositoryURL =
    r"'http://127.0.0.1:3030/playground/test/interacting_test_s/index.html'";

void main() {
  test('Test 1', () {
    var a = 10;
    expect(a, equals(10));
  });

  test('Server trip test', () {
    var callback = expectAsync((){});
    serverTrip(callback);
  });
  //serverTrip();
  test('Test 4', () {
    var b = 10;
    expect(b, equals(10));
  });

  test('checkProgress1', () {
    var callback = expectAsync((){});
    checkProgress1(callback);
  });
}

void serverTrip(callback) {
  //test('Server trip test', () {
  var repositoryURL =
      r"http://usryeddrint451v.asg.com:8080/ddrint/ServiceDirect/getRepositories";
  var bytes = encodeUtf8("demouser:luminist");
  var base64 = CryptoUtils.bytesToBase64(bytes);
  var auth = "Basic " + base64;
  var httpRequest = new HttpRequest();
  //    httpRequest.withCredentials = true;
  httpRequest.open('GET', repositoryURL);
  //    httpRequest.setRequestHeader("Content-type",
  //        "application/x-www-form-urlencoded");
  //    httpRequest.setRequestHeader("Authorization", auth);
  httpRequest.onLoadEnd.listen((ee) => checkProgress(callback));
  httpRequest.onError.listen((ee) => handleError());
  print('Sending request');
  httpRequest.send('');
  // });
}

void checkProgress(callback) {
  print("Print -- Called checkProgress");

  var bytes = encodeUtf8("demouser:luminist");
  var base64 = CryptoUtils.bytesToBase64(bytes);
  var auth = "Basic " + base64;
  var httpRequest = new HttpRequest();

  //httpRequest.withCredentials = true;

  httpRequest.open('GET', repositoryURL);
  //  httpRequest.setRequestHeader("Content-type",
  //      "application/x-www-form-urlencoded");
  //  httpRequest.setRequestHeader("Authorization", auth);

  httpRequest.onLoadEnd.listen((ee) => checkProgress1(callback));
  httpRequest.onError.listen((ee) => handleError());
  httpRequest.send('');
}

void checkProgress1(callback) {
  var a = 10;
  expect(a, equals(10));
  callback();
}


void handleError() {
  print("Error");
}
