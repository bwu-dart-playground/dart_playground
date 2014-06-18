import 'dart:html' as dom;

main () {
  var ps = dom.querySelectorAll('ul > li > p');
  ps.forEach((dom.HtmlElement e) => print(e.innerHtml));
}

