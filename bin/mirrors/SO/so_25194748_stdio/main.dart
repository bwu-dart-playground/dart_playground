import 'dart:math' as math;
import 'dart:mirrors' as mirr;

void main() {
  math.Rectangle r = new math.Rectangle(10, 10, 20, 20);
  mirr.InstanceMirror im = mirr.reflect(r);
  var r2 = im.reflectee;
  print('r top-left: ${r.topLeft}, r2 top-left: ${r2.topLeft}');
}