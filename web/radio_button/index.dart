import 'dart:html' as dom;

main () {
  dom.querySelectorAll('input[type="radio"]').onClick.listen(bandBtnClicked);
  dom.querySelectorAll('button').onClick.listen(bandBtnClicked);
}

void bandBtnClicked(event) {
  (dom.querySelector('#B08') as dom.RadioButtonInputElement).checked = true;
}
