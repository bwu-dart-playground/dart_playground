import 'dart:html';

void main() {
  var output = querySelector('#imported-div');

  var link = document.querySelector('link[rel=import]');
  var importedFile = link.import;

  output.append(importedFile.querySelector('div#imp').clone(true));
}
