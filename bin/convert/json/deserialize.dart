import 'package:json_object/json_object.dart';
import 'dart:convert';

abstract class Language {
  String language;
  List targets;
  Map website;
}

@proxy
class LanguageImpl extends JsonObject implements Language {
  LanguageImpl();

  String language;
  List targets;
  Map website;

  factory LanguageImpl.fromJsonString(string) {
    return new JsonObject.fromJsonString(string, new LanguageImpl());
  }
  noSuchMethod(i) => super.noSuchMethod(i);
}

void main(args) {
  var l = new LanguageImpl();
  l.language = 12.34;

  var lang1 = new LanguageImpl.fromJsonString('{"language":"Dart"}');
  print(JSON.encode(lang1));
  print(lang1.language);
  print(lang1.language + "!");
  var lang2 = new LanguageImpl.fromJsonString('{"language":"13.37000"}');
  print(JSON.encode(lang2));
  print(lang2.language);
  print(lang2.language + "!");
}