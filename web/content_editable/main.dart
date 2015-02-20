library x;

import 'dart:html' as dom;

dom.DivElement editable;
dom.Range range;


void main() {
  editable = (dom.document.querySelector('#editable') as dom.DivElement);
  //editable.onBlur.listen(getRange);

  dom.document.onSelectionChange.listen(getRange);

  dom.ButtonElement button = (dom.document.querySelector('#button') as dom.ButtonElement);
  button.onClick.listen((e) => onClick(e));

  dom.AnchorElement a = (dom.document.querySelector('#href') as dom.AnchorElement);
  //a.onFocus.listen(getRange);
  a.onClick.listen(onClick);
}

void onClick(dom.MouseEvent e, [y, z]) {
  dom.DivElement div = new dom.DivElement();
  div.appendText('xxx');
  insertNodeAfterSelection(range, div);
  print('$e $y $z');
}

void insertNodeAfterSelection(dom.Range range, dom.Node node) {
  range.collapse(false);
  range.insertNode(node);
}

void getRange(dom.Event e) {
  if(dom.document.activeElement != editable) {
    return;
  }
  print('SelectionChange: ${e}');
  dom.Selection sel;

  sel = dom.window.getSelection();
  if(sel != null) {
    range = sel.getRangeAt(0);
    print('${range.startOffset} ${range.endOffset}');
  }
}

