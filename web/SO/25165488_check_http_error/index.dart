library playground.index;

import 'dart:html';

DivElement myDiv;

Element list_container;

main() {
  querySelector('button').onClick.listen(buttonClickHandler);
  print('ready');
}

void buttonClickHandler(MouseEvent e) {
  //loadData('https://cors-test.appspot.com/test');
  loadData('http://www.google.com');
}

handleFailure(error) {
  print('Something went wrong.');
  if(error is ProgressEvent && (error as ProgressEvent).type == 'error') {
    print('handleFailure: An error has occured');
  }
}

handleProgress(p) {
  print('handleProgress - status: ${((p as ProgressEvent).target as HttpRequest).status}');
}

void loadData(String url) {

  //url = "${baseRestfulUrl}"+ QUERY_ALL_TARGET_ASSETS_BASE_URL;
  print(url);
  //call the web server asynchronously
  HttpRequest.getString(url, onProgress: handleProgress)
  .then(onDataLoaded)
  .catchError(handleFailure);
}

void onDataLoaded(e) {
  print('onDataLoaded: $e');
}
