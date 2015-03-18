library myapp;

//import "dart:js" as js;

part 'lookups.dart';


String serverName; // = "serverName";

class Place {
  static String SERVER_NAME;

  static final SigninPlace = const Place._("signin");
  static final SignoutPlace = const Place._("signout");

  static get values => [SigninPlace, SignoutPlace];

  String get fragmentURL {
    Map places = {
                  "signin": "http://${SERVER_NAME}/signin",
                  "signout" : "http://${SERVER_NAME}/signout" };
    return places[_fragmentURL];
  }
  final String _fragmentURL;

  const Place._(this._fragmentURL);
}

void main(List<String> args) {
  Place.SERVER_NAME = "aServer";
  print(Place.SigninPlace.fragmentURL);
}