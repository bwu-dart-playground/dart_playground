import 'dart:html';
import 'dart:async';


main () {
  var gp = window.navigator.getGamepads();

  window.on['gamepadconnected'].listen((e) {
    var gamepad = e.gamepad;
  });
}

