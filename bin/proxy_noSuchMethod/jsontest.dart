library x;

import "package:json_object/json_object.dart";

abstract class Language {
  String language;
  List targets;
  Map website;
}

@proxy
class LanguageImpl extends JsonObject implements Language {
  LanguageImpl(); 

  factory LanguageImpl.fromJsonString(string) {
    return new JsonObject.fromJsonString(string, new LanguageImpl());
  }
  
  void noSuchMethod(InvocationMirror) {
    
  }
}

void main(List<String> x) {
  
}