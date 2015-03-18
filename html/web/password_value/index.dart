import 'dart:html';

main () {

  querySelector('button').onClick.listen(clickHandler);

}

void clickHandler(MouseEvent e) {
  InputElement passwordInput = querySelector('[name="psswd"]');
  InputElement psswdConfirmInput = querySelector('[name="psswd-confirm"]');
  print('passwordInput: ${passwordInput.value}');
  print('confirm: ${psswdConfirmInput.value}');
  if (passwordInput.value != psswdConfirmInput.value) {
    //showBlock(querySelector("#signup-psswd-error1"));
    return;
  }
}

