import 'dart:html';
import 'dart:async';

void main() {
  InputElement input = querySelector('#input');
  ButtonElement changeUrl = querySelector('#changeurl');

  changeUrl.onClick.listen((event) {
    print('input: ${input.value}');
    //window.history.pushState('${input.value}', 'test tile', '#${input.value}');
    window.location.hash = input.value;
  });

  String baseUrl = window.location.pathname;
  if(!baseUrl.endsWith('/')) {
    baseUrl = baseUrl.substring(0, baseUrl.lastIndexOf('/'));
  }

  Map urls = {
    '/' : showRoot,
    '/index.html' : showRoot,
    '/user/:id' : showUserProfile
  };

  window.onHashChange.listen((e) {
    print('hashChange: ${window.location.hash}');
  });

  window.onPopState.listen((e) {
    //print(e.)
    print('onPopState: ${window.location.hash}');
  });

  window.onPopState.listen((_) {
    var location = window.location.pathname;
    if(location.startsWith(baseUrl)) {
      location = location.substring(baseUrl.length);
    }

    var locMethod = urls[location];
    if(locMethod == null) {
      showRoot();
    }
  });
}

void showRoot() {
  print('showRoot');
  document.body.append(new DivElement()..text = 'showRoot');
}

void showUserProfile() {
  print('showUserProfile');
  document.body.append(new DivElement()..text = 'showUserProfile');
}

void pageNotFound() {
  print('pageNotFound');
  document.body.append(new DivElement()..text = 'pageNotFound');
}
