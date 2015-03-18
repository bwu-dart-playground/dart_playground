import 'dart:html';
import 'dart:async';

var components = [];
var times_to_run = 40;

class MockComponent {
  Element element = new Element.html('<table></table>');

  remove() {
    element.remove();
    element = null;
  }
}

removeObject(c) => c.remove();

Future<bool> createAndRemoveComponents() {
  return new Future(() {
    var n = 50000; // number of objects to create and delete in this run

    print("***Run #${times_to_run}");
    print("creating $n objects...");
    for(var i=0; i < n; i++) {
      components.add(new MockComponent());
    }
    print("...done");


    print("removing $n objects...");
    while(components.length > 0) {
      components.removeAt(0).remove();
    }
    print("...done");

    times_to_run -= 1;

    if(times_to_run <= 0) {
      components = null;
      //t.cancel();
    }
    return true;
  });
}

Future<bool> start() {
  return createAndRemoveComponents().then((bool value) {
    if(times_to_run-- > 0) {
      print('restart: $times_to_run to go');
      return start();
    } else {
      print('end');
      return false;
    }
  });
}

void main() {
  //new Timer.periodic(const Duration(seconds: 10), createAndRemoveComponents);
  start();
}