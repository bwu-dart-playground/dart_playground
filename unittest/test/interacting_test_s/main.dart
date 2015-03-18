import 'dart:html';
import 'package:unittest/unittest.dart';
import 'package:unittest/html_enhanced_config.dart';

var repositoryUrl = 'http://127.0.0.1:3030/playground/test/interacting_test_s/index.html';

void main() {
  useHtmlEnhancedConfiguration();
  var myDiv = querySelector("#myDiv");
  var myDiv2 = querySelector("#myDiv2");

    test("Test visibility 1", (){
      myDiv.hidden = true;
      expect(myDiv.hidden, true, reason:"Is it still visible");
    });


    test("Test visibility 2", (){
      myDiv.hidden = false;
      expect(myDiv.hidden, false, reason:"Is it still invisible");
    });

  test("xxx", () {
    var httpRequest = new HttpRequest();
    //httpRequest.withCredentials = true;
    httpRequest.open('GET', repositoryUrl);
    //httpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    //httpRequest.setRequestHeader("Authorization", auth);

    var callback = expectAsync(() {
      repositoryListComplete(httpRequest);
    });
    httpRequest.onLoadEnd.listen((ee) => callback());
    httpRequest.onError.listen((ee) => handleError(ee));
    httpRequest.send('');
  });
}
void repositoryListComplete(HttpRequest request) {
  print('Testing URL connection for ${repositoryUrl}');
}

void handleError(e) {
  print('handleError: ${e}');
}

