import 'dart:html' as dom;
import 'dart:async' as async;
import 'dart:convert' as convert;


void btnClickHandler(dom.MouseEvent e) {
  var stream = new async.StreamController<String>();
  convert.LineSplitter ls = new convert.LineSplitter();
  ls.bind(stream.stream).listen((e) => print('====${e}===='));


  new dom.HttpRequest()
    ..open('GET', 'data.txt')
    ..onLoad.listen((dom.ProgressEvent e) {
      print(e);
    })
//    ..onProgress.transform(stream).listen((e) {
//        stream.add((e.target as dom.HttpRequest).responseText);
//      })
    ..onReadyStateChange.listen((dom.ProgressEvent e) {
      if((e.target as dom.HttpRequest).readyState > 2) {
        print((e.target as dom.HttpRequest).responseText);
      }
    })
    ..send();
}


main () {
  dom.querySelector('#btn').onClick.listen(btnClickHandler);
}



dataHandler(String value) {
  print(e);
}
