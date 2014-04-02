library x;

import 'dart:math';

class PlotRectangle<T extends num> extends Rectangle<T> {
  PlotRectangle(T left, T top, T width, T height) : super(left, top, width, height);

  String color = 'red';

  factory PlotRectangle.fromPoints(Point<T> a, Point<T> b) {
    T left = min(a.x, b.x);
    T width = max(a.x, b.x) - left;
    T top = min(a.y, b.y);
    T height = max(a.y, b.y) - top;
    return new PlotRectangle<T>(left, top, width, height);
  }

  PlotRectangle.withColor(T left, T top, T width, T height, this.color) : super(left, top, width, height);

  @override
  String toString() => '${super.toString()}, $color';
}

void main(List<String> args) {
  var r = new PlotRectangle(17, 50, 30, 28);
  print(r);
  var rc = new PlotRectangle.withColor(17, 50, 30, 28, 'blue');
  print(rc);
}