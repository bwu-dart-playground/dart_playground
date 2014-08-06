library playground.index;

import 'dart:html';

DivElement myDiv;

main() {
  querySelector('button').onClick.listen(buttonClickHandler);
  myDiv = querySelector('div');
}

void buttonClickHandler(MouseEvent e) {
  myDiv.children.clear();

  myDiv.append(new TableElement()
    ..append(new TableRowElement()
      ..append(new TableCellElement())
      ..append(new TableCellElement()
        ..append(new TableElement()
          ..append(new TableRowElement()
            ..append(new TableCellElement()
              ..append(new ParagraphElement()
                ..text = 'p1')))
          ..append(new TableRowElement()
            ..append(new TableCellElement()
              ..append(new ParagraphElement()
                ..text = 'p2')))
          ..append(new TableRowElement()
            ..append(new TableCellElement()
              ..append(new ParagraphElement()
                ..text = 'p3')))))));

//  var tabm = new TableElement();
//  var colm = new TableRowElement();
//  var cell1 = new TableColElement();
//  var cell2 = new TableColElement();
//  var tab1 = new TableElement();
//  var tab2 = new TableElement();
//  var col1 = new TableColElement();
//  var row1 = new TableRowElement();
//  var row2 = new TableRowElement();
//  var row3 = new TableRowElement();
//  var row4 = new TableRowElement();
//
//  var p1 = new ParagraphElement();
//  p1.text = "This is p1";
//  var p2 = new ParagraphElement();
//  p2.text = "This is p2";
//  var p3 = new ParagraphElement();
//  p3.text = "This is p3";
//  var p4 = new ParagraphElement();
//  p4.text = "This is p4";
//
//
//  row1.children.add(p1);
//  row2.children.add(p2);
//  row3.children.add(p3);
//  row4.children.add(p4);
//
//  col1.children.add(row1);
//  col1.children.add(row2);
//  col1.children.add(row3);
//  col1.children.add(row4);
//  tab2.children.add(col1);
//  cell1.children.add(tab1);
//  cell2.children.add(tab2);
//  colm.children.add(cell1);
//  colm.children.add(cell2);
//  tabm.children.add(colm);
//  ///
//
//  //var header = new HeadingElement.h1();
//  //header.text = "First Page";
//  //header.id = "myh";
//
//  /// Adding elements
//  MyDiv.children.add(tabm);
//  MainDiv.children.add(MyDiv);
////  MainDiv.children.add(Stopka);
//  document.body.children.add(MainDiv);
//  document.body.style.backgroundColor = "orange";
}
