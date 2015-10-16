import 'dart:html';
import 'dart:async';
import 'dart:convert';

StreamSubscription onTransitionEndSubscription;

class MovingThing {
  String         name;
  DivElement     sprite    = new DivElement();
  List<Point>    points;

  MovingThing(this.name){


    sprite.id   = name;
    sprite.text = name;
    sprite.style
      ..top        = "30px"
      ..left       = "30px"
      ..border     = "1px solid black"
      ..position   = "absolute"
      ..transition = "all 1.5s ease-in-out"
        //..transition = "all 1.5s linear"
      ..width      = "30px"
      ..height     = "30px"
;

    document.body.children.add(sprite);
  }

  void move(int idx) {

    if(idx >= points.length) {
      return;
    } else {
      var f = sprite.onTransitionEnd.first.then((TransitionEvent e) {
        new Future(() {
        print('transitionEnd$idx');
        move(idx + 1);
        });
      });

      sprite.style
      ..top  = '${points[idx].x}px'
      ..left = '${points[idx].y}px';
      sprite.text = '$idx';
    }
  }
}

Map data;
void btnClickHandler(MouseEvent e) {
  String name = (querySelector('[name="pseudo"]') as TextInputElement).value;

  data = {'pseudo': name};
  String encode = JSON.encode(data);

  print('name: $name');
  WebSocket wss = new WebSocket('ws://127.0.0.1:4040/ws');
  wss.onOpen.listen((_) => wss.send(encode));
  wss.onMessage.listen((msg) => print("Msg received : ${msg.data}"));

}

main () {

  (querySelector('[name="push"]') as ButtonInputElement).onClick.first.then(btnClickHandler);
//  var request = new HttpRequest();
//  request.open('GET', 'http://127.0.0.1:3030/playground/web/animate_manual/index.html');
//  request.setRequestHeader("Cookie", "JSESSIONID=cdsfaldskfjaölsdjf");
//  request.setRequestHeader("User-Agent", "test");
//  request.withCredentials = true;
//  request.send();
//
//  return;

  List<Point> points = [
    new Point(120, 120)
    , new Point(200, 20)
    , new Point(20, 200)
    , new Point(100, 100)
    , new Point(150, 30)
    , new Point(30, 150)
    , new Point(20, 20)
    , new Point(120, 120)
  ];

  MovingThing mt = new MovingThing("MT");
  mt.points = points;
  new Future(() => mt.move(0)); //.then((val) => print('done'));
}

