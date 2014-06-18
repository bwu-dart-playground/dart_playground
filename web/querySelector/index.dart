import 'dart:html';
//import 'dart:async';
//import 'dart:convert';

List<Element> decendantSelector(Element rootElement,
    {List<Element> collectedElements: null, List<String> targetAttributes: null,
    bool mustHaveAllAttributes: false}) {

  if (collectedElements == null) collectedElements = new List<Element>();


  for (Element child in rootElement.children) {
    bool haveAllAttributesFlag = true;
    for (String attrName in targetAttributes) {
      if (child.attributes.containsKey(attrName)) {
        collectedElements.add(child);
      } else {
        haveAllAttributesFlag = false;
      }
      if (!haveAllAttributesFlag && mustHaveAllAttributes) break;
    }
    if (child.hasChildNodes()) {
      decendantSelector(child,
        collectedElements: collectedElements, targetAttributes: targetAttributes,
        mustHaveAllAttributes: false);
    }
  }
  return collectedElements;
}

main() {
  Set<Element> result = new Set<Element>();
  result.addAll(querySelector('view').querySelectorAll('view [data-bind-two-way]'));



//  List<Element> descendantsWithAttributeDataBindTwoWay = decendantSelector(
//      querySelector('view'), targetAttributes: ['data-bind-two-way']);
}
