import 'dart:html' as dom;
import 'dart:async' as async;
import 'dart:convert' show JSON;

class Xxx {

  static async.Future getObjectData(List jsonMap) {

    return async.Future.forEach(jsonMap, (item) {
      var request = new dom.HttpRequest();
      request
          ..open("GET", "https://www.googleapis.com/discovery/v1/apis?fields=")
      //var request = buildRequest("GET", resourceUrl);
          ..send();
      request.onLoadEnd.first.then((event) => fillObject(event.target));
    });
  }

  static fillObject(dom.HttpRequest request) {
    print('fillObject');
    String responseText = request.response;
//    List stringJson = JSON.decode(responseText);
  }
}

void main() {
  var json = ['a', 'b', 'c'];
  Xxx.getObjectData(json).then((_) => print('done'));
}


