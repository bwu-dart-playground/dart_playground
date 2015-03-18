import 'dart:html';
import 'dart:async';

final CanvasElement m_canvas = querySelector("#canvas");

//void main() {
//  context = m_canvas.context2D;
//
//  new Timer.periodic(new Duration(milliseconds: 1000~/60), (_) => window.animationFrame.then((_) => draw(_)).then((_) => getImageData()));
//}
//
//
//int i = 0;
//CanvasRenderingContext2D context;
//
//void getImageData() {
//  print(i);
//  var imageData = context.getImageData(0, 0, m_canvas.width, m_canvas.height);
//}
//
//void draw(num _) {
//  context.clearRect(0, 0, m_canvas.width, m_canvas.height);
//  context.fillText((i++).toString(), 10, 10);
//}

int i = 0;
void main() {
  // scheduleMicrotask(requestRedraw);

  querySelector("#sample_text_id")
  ..onClick.listen((e) => fizz);
}

void fizz(MouseEvent mouseEvent, String s) {
    print("Hello $s!");
}

void requestRedraw() {
  if(true)
  {
    window.requestAnimationFrame(draw);
  }
}

void draw(num _) {
  var context = m_canvas.context2D;
  context.clearRect(0, 0, m_canvas.width, m_canvas.height);
  //context.fillText((i++).toString(), 10, 10);
  var imageData = context.getImageData(0, 0, m_canvas.width, m_canvas.height);
  print(i++);
  requestRedraw();
}