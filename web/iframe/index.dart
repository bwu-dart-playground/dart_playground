import 'dart:html' as dom;

void main() {
  var ifrm = (dom.querySelector('#ifrm') as dom.IFrameElement);

  (dom.querySelector('button#b') as dom.ButtonElement).onClick.listen((e) {
    var x = ifrm.contentWindow.postMessage("button pressed", "*"); //.document.querySelector('#text');
  });

  ifrm.onLoad.listen((e) {
    var x = ifrm.contentWindow.postMessage("IFrame loaded", "*"); //.document.querySelector('#text');
  });
}
