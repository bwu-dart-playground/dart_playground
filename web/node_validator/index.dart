library x;

import 'dart:html';

void main() {
  String dangerousHtml = "<div><span>Günter Zöchbauer</span><script>window.alert('bla')</script><input type='button' text='xxx'>ldskjf</button></div>";
  window.onClick.listen((e) => print("click"));
  querySelector('#div1').setInnerHtml(dangerousHtml);

  querySelector('#div2').innerHtml = dangerousHtml;

  querySelector('#div3').append(new Element.html(dangerousHtml));

  var df = new DocumentFragment.html(dangerousHtml);
  querySelector('#div4').append(df);

  querySelector('#div5').appendHtml(dangerousHtml);

  querySelector('#div6').appendText(dangerousHtml);

}