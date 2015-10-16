import 'dart:io';
import 'dart:async';
//import 'package:http/http.dart';
import 'dart:convert' show UTF8, JSON;

main() async {
  var json;
  json = await makeRequest('https://pub.dartlang.org/api/packages');
//  json = await makeRequest('https://pub.dartlang.org/api/packages/polymer');
  print(json);
  print('*** request complete ***');
  json = await makeRequest('https://pub.dartlang.org/api/packages');
  print(json);
  print('*** request complete ***');
  exit(0);
}

Future<String> makeRequest(String url) async {
  var request = await new HttpClient().getUrl(Uri.parse(url));

  // Includes the access token in the request headers.
  //request.headers.add(...);

  // Waits until the request is complete.
  var response = await request.close();

//  var json = '';

  return response.transform(UTF8.decoder).transform(JSON.decoder).join('');
//  return response.transform(UTF8.decoder).join('');

//  await for (var contents in response.transform(UTF8.decoder)) {
////    print('chunk');
//    json += contents;
//    // Putting a break here produces the same output but terminates immediately (as wanted).
//  }

//  print('x');
//  return json;
}
