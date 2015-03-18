import 'dart:html';
import 'dart:js' as js;

bool _hasTouchSupport;
bool get hasTouchSupport {
  if(_hasTouchSupport == null) {
    _hasTouchSupport = js.context.callMethod('hasTouchSupport');
  }
  return _hasTouchSupport;
}

void main() {
    print(hasTouchSupport);
}

