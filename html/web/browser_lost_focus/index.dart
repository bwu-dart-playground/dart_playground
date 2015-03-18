import 'dart:html' as dom;
import 'dart:async';

void main() {
  dom.document.onVisibilityChange.listen(visibilityChangeHandler);
  dom.window.onFocus.listen(focusHandler);
  dom.window.onBlur.listen(blurHandler);
}

void visibilityChangeHandler(dom.Event e) {
  print('visibility changed: $e');
}

void focusHandler(dom.Event e) {
  print('focus: $e');
}

void blurHandler(dom.Event e) {
  print('blur: $e');
}
