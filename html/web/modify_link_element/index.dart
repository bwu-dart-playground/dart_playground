import 'dart:html';

void main() {
  document.querySelector('#button').onClick.listen((_) {
  var stile = document.head.querySelector('#mystyle');
  stile.attributes['href'] = 'stile-blu.css';
  });
}

