library x;

import 'dart:html';

void main() {
  Map query = {
    'xx': 'yy',
    'zz': 'ss'
  };
  Uri uri =
      new Uri(
          path: "http://localhost:8080/myapp/signinService",
          queryParameters: query);
  print('URI: ${uri.toString()}');


  querySelector("#signinForm")..onSubmit.listen(handle);
}

void handle(Event event) {
  event.preventDefault();

  FormElement formElement = event.target as FormElement;

  var url = "http://localhost:8080/myapp/signinService";

  HttpRequest.request(
      url,
      method: formElement.method,
      sendData: new FormData(formElement)).then(onDataLoaded);
}


void onDataLoaded(HttpRequest req) {
  req.responseHeaders.forEach((k, v) {
    print('Header: $k, value: $v');
  });
  String response = req.responseText;
  if (response == 1) {
    window.alert("You are signed in!");
  } else {
    window.alert("Sign in failed. Check credentials.");
  }
}
