import 'dart:io';
import 'package:xml/xml.dart';

void main() {
  new File("example.xml").readAsString()
  .then((xmlContent) {
    var parsedXml = parse(xmlContent);
    return parsedXml.findElements("root")
        .first.findElements("row").toList()[1]
            .findElements('name').first.text; // <= modified
  })
  .then((text) {
    print(text);
  });
}
