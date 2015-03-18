// test.dart
import 'dart:html';
void main() {
  print('started');
  document.body.append(new ButtonElement()
    ..id='nav-askquestion'
    ..onClick.listen((e) => print('clicked')));
  document.querySelector('#nav-askquestion').click();
  print('finished');
}
