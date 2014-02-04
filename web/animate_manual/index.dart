import 'dart:html';
import 'dart:async';

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

main () {
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

