import 'dart:html' as dom;

main () {
  dom.document.head.append(new dom.StyleElement());
  final styleSheet = dom.document.styleSheets[0] as dom.CssStyleSheet;
  final rule = 'div { color: blue; }';
  styleSheet.insertRule(rule, 0);
}

