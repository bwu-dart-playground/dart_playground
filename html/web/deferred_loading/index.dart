import 'dart:html';
import 'dart:async';
import 'dart:convert';

@lazy
import 'deferred_lib.dart' as foo;

const lazy = const DeferredLibrary('deferred_lib');

main () {
  //foo.init(); // Supposed to throw a NoSuchMethodError.
   lazy.load().then(onFooLoaded);
}

void onFooLoaded(_) {
  foo.init();
}