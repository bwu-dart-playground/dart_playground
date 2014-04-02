library x;

import 'dart:html';

DivElement editable;
Range range;


void main() {
  editable = (document.querySelector('#editable') as DivElement);
  //editable.onBlur.listen(getRange);

  document.onSelectionChange.listen(getRange);


  ButtonElement button = (document.querySelector('#button') as ButtonElement);
  button.onClick.listen((e) => onClick(e));

  AnchorElement a = (document.querySelector('#href') as AnchorElement);
  //a.onFocus.listen(getRange);
  a.onClick.listen(onClick);
}

void onClick(MouseEvent e, [y, z]) {
  DivElement div = new DivElement();
  div.appendText('xxx');
  insertNodeAfterSelection(range, div);
  print('$e $y $z');
}

void insertNodeAfterSelection(Range range, Node node) {
  range.collapse(false);
  range.insertNode(node);
}

void getRange(Event e) {
  if(document.activeElement != editable) {
    return;
  }
  print(e);
  Selection sel;

  sel = window.getSelection();
  if(sel != null) {
    range = sel.getRangeAt(0);
  }
}

