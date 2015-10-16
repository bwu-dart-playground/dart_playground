import 'dart:html';
import 'dart:convert' show JSON;

void saveContact() {
  Storage localStorage = window.localStorage;

  var first = (querySelector("#firstname") as InputElement).value;
  var last = (querySelector("#lastname") as InputElement).value;
  var email = (querySelector("#email") as InputElement).value;
  var mobile = (querySelector("#mobile") as InputElement).value;
  var home = (querySelector("#home") as InputElement).value;
  var office = (querySelector("#office") as InputElement).value;

  var contact = {
    "firstname" : first,
    "lastname" : last,
    "email" : email,
    "mobile" : mobile,
    "home" : home,
    "office" : office
  };

  localStorage['$first $last'] = JSON.encode(contact);
  var test2 = JSON.decode(localStorage['$first $last']);
  var result = querySelector("#divContents");
  result.text = test2.toString();
}
void main() {
  querySelector('#savecontacts').onClick.listen((_) {
    saveContact();
    print('saved');
  });
}
