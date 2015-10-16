library x;

import 'dart:html' as dom;

void main () {
  dom.window.onResize.listen((e) {
//    var gcs = dom.document.body.getComputedStyle('::after');
//    print(gcs);
//    print(gcs.content);
//    List<dom.CssRule> rules = dom.window.getMatchedCssRules(dom.document.body, '::after');
//    (rules[0] as dom.CssStyleRule).style.display = 'block';
//    print(rules);
    List<dom.StyleSheet> sheets = dom.document.styleSheets;
    print(sheets);
    for(dom.CssStyleSheet sheet in sheets) {
      for (dom.CssStyleRule rule in sheet.cssRules.where((r) => r is dom.CssStyleRule)) {
        print(rule);
        rule.style.
      }
      print(sheet);
    }

  });
  // getComputedStyle

}


