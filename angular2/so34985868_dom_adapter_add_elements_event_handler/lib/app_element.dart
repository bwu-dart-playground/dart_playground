library so34985868_dom_adapter_add_elements_event_handler.app_element;

import 'dart:html' show window;
import 'package:angular2/core.dart' show Component, View, Input, Output;
import 'package:angular2/platform/browser.dart' show BrowserDomAdapter;

// Gitter private message
// http://plnkr.co/edit/AwkUHItsauXS4x5JISis?p=preview

@Component(selector: 'app-element',template: '''
<h1>app-element</h1>
<button (click)="add()">Add</button>
''' //,
//    directives: const [FORM_DIRECTIVES]
    )
class AppElement {
  BrowserDomAdapter _dom;
  AppElement(this._dom);

  void add() {
    var a = _dom.createElement('button');
    _dom.setInnerHTML(a, 'button');
//         a.onClick.listen()
//         _dom.createEvent(close);
//         _dom.createMouseEvent('onclick');
    _dom.appendChild(_dom.query("my-app"), a);
    _dom.dispatchEvent(_dom.query("button"), close());
  }

  close() {
    window.alert('h');
  }
}
