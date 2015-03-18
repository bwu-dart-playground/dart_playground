import 'dart:html' as dom;

void main() {
  var source = dom.querySelector('#source');
  var dest = dom.querySelector('#target');
  dest.children.clear();
  dest.children.addAll(source.children.map((n) => n.clone(true)));
}

