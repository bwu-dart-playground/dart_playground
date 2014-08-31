library playground.index;

import 'dart:html';

DivElement myDiv;

Element list_container;

main() {
  querySelector('button').onClick.listen(buttonClickHandler);
  list_container = querySelector('#list_container_id');

  for(int i = 0; i < 10; i++) {
    CheckboxInputElement cie = new CheckboxInputElement();
    LabelElement label = new LabelElement();
    cie.id="checkboxid_${i}";//unique id
    label.htmlFor = 'checkboxid_${i}';//bind Label to checkbox
    label.text = '${i}';
    list_container.children.add(cie);
    list_container.children.add(label);
    list_container.children.add(new Element.html("<br>"));//linebreak after the checkbox
  }
}

void buttonClickHandler(MouseEvent e) {
  List list1 = [];
  for (var elem in list_container.children.where((e) => e is CheckboxInputElement)){
    if(elem.checked){
      list1.add(elem.value);
    }
  }
  print('list1: ${list1}');

  List list2 = [];
  list2.addAll(list_container.children.where((e)
      => e is CheckboxInputElement && e.checked).map((e) => e.value));
  print('list2: ${list2}');

  List list3 = [];
  list3.addAll(querySelectorAll('#list_container_id input[type="checkbox"]')
      .where((e) => e is CheckboxInputElement && e.checked)
      .map((e) => e.value));
  print('list3: ${list3}');
}
