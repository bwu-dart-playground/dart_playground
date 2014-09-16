import 'dart:html' as dom;
import 'package:polymer/polymer.dart';

@CustomTag('app-element')

class AppElement extends PolymerElement {

  /// Constructor used to create instance of AppElement.
  AppElement.created() : super.created() {
  }

  @override
  void attached() {
    super.attached();
    dom.window.onMouseMove.listen(mouseMoveHandler);
  }

  PolymerJob mouseMoveJob;
  void mouseMoveHandler(dom.MouseEvent e) {
    print('mousemove');
    mouseMoveJob = scheduleJob(mouseMoveJob, onDone, new Duration(milliseconds: 500));
  }

  void onDone() {
    print('done');
  }
}
