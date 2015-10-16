import 'dart:html';

String dangerousHtml(String name) {
  return '''
  <div>
    <span>Some text</span>
    <script type="text/javascript">
      window.alert("bla");
    </script>
    <input type="button" text="xxx" onclick="window.alert('bla');" value="$name"></button>
  </div>''';

}
void main() {
  window.onClick.listen((e) => print("click"));

  print('setInnerHtml'); // removes
  querySelector('#div1').setInnerHtml(dangerousHtml('setInnerHtml'));

  print('innerHtml'); // removes
  querySelector('#div2').innerHtml = dangerousHtml('innerHtml');;

  print('new Element.html'); // removes
  querySelector('#div3').append(new Element.html(dangerousHtml('new Element.html')));

  print('new DocumentFragment.html');   // removes
  var df = new DocumentFragment.html(dangerousHtml('new DocumentFragment.html'));
  querySelector('#div4').append(df);

  print('appendHtml'); //
  querySelector('#div5').appendHtml(dangerousHtml('appendHtml'));

  print('appendText');
  querySelector('#div6').appendText(dangerousHtml('appendText'));
}
