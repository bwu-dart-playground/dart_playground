
import 'dart:html';
import 'dart:convert';

var json = { "names": [ "Anne", "Bette",],
"appellations": [ "Awesome", "Captain",
]};

void main() {
  querySelector('#generateButton').onClick.listen(clickHandler);
}

void clickHandler(e) {
  var file = JSON.encode(json);
  var data = JSON.decode(json);
  data[names].add((querySelector('#inputName') as dom.TextInputElement).value);
  file JSON.encode(data);
  print(file);
}