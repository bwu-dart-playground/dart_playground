import 'dart:html' as dom;
import 'dart:async';
import 'dart:convert';


main () {
  dom.window.navigator.geolocation.getCurrentPosition().then((e) => print(e.coords.longitude));
}

