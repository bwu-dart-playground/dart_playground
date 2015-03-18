import 'dart:html';
import 'dart:async' show Future, Completer;

class MyClass {

  // Define buttons
  ButtonElement okButton = new ButtonElement()..text = 'OK';
  ButtonElement cancelButton = new ButtonElement()..text = 'Cancel';

  // Define a constructor
  MyClass(){
    // Create a dialog, define buttons
  }
}

void main() async {
  var dialogResult = await myFunction();
}

// Define bool function
Future<bool> myFunction() async {
  Completer c = new Completer();
  // Create a new instance of class
  MyClass myNewClass=new MyClass();

  // Return bool value after user clicked on some button
  myNewClass.okButton.onClick.first.then((e) => c.complete(true));
  myNewClass.cancelButton.onClick.first.then((e) => c.complete(false));

  return c.future;
}
