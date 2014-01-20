library x;

import 'dart:html';

void main() {
  window.navigator
    .geolocation.getCurrentPosition()
      ..then((pos) {

        window.alert(pos.toString());
      })
        ..catchError((PositionError error) {
          window.alert("Error code: ${error.code}, Error message: ${error.message}");
        })
          ..whenComplete(() => window.alert("complete"))
          ;
}