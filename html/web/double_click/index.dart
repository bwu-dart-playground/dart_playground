library app_element;

import 'dart:html' as dom;
import 'dart:async' as async;

Duration dblClickDelay = new Duration(milliseconds: 500);
async.Timer clickTimer;

void clickHandler(dom.MouseEvent e, [bool forReal = false]) {
  if(clickTimer == null) {
    clickTimer = new async.Timer(dblClickDelay, () {
      clickHandler(e, true);
      clickTimer = null;
    });
  } else if(forReal){
    print('click');
  }
}

void dblClickHandler(dom.MouseEvent e) {
  if(clickTimer != null) {
    clickTimer.cancel();
    clickTimer = null;
  }
  print('doubleClick');
}

//void main() {
//  dom.querySelector('button')
//    ..onClick.listen(clickHandler)
//    ..onDoubleClick.listen(dblClickHandler);
//}

void main() {
  dom.querySelector('button')
    ..onClick.listen(clickHandler)
    ..onDoubleClick.listen(dblClickHandler);
}
