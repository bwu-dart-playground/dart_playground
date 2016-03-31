library so34715315_key_long_press.app_element;

import 'dart:html' show Element, KeyboardEvent;
import 'dart:async'
    show Stream, StreamController, StreamSubscription, StreamTransformer, Timer;
import 'package:angular2/angular2.dart'
    show
        Component,
        Directive,
        ElementRef,
        EventEmitter,
        HostBinding,
        HostListener,
        Input,
        OnDestroy,
        Output,
        View;

@Component(selector: 'app-element',templateUrl: 'app_element.html', directives: const [LongPress])
class AppElement {
  int keyCode;
  bool longPressed(KeyboardEvent event) {
    keyCode = event.keyCode;
    return true;
  }
}

@Directive(selector: '[(longpress)]', host: const {
//  '(keydown)': r'keyEventHandler($event)',
//  '(keyup)': r'keyEventHandler($event)'
})
class LongPress {
  ElementRef _elementRef;
  LongPress(this._elementRef) {
    print('longpress');
    (_elementRef.nativeElement as Element).onKeyDown.listen(keyEventHandler);
    (_elementRef.nativeElement as Element).onKeyUp.listen(keyEventHandler);
  }

  @Output() EventEmitter<KeyboardEvent> longpress =
      new EventEmitter<KeyboardEvent>();

  KeyboardEvent _startEvent;
  @Input() Duration longpressDelay = new Duration(seconds: 2);
  Timer timer;

//  @HostListener("keydown", const [r"$event"])
//  @HostListener("keyup", const [r"$event"])
  void keyEventHandler(KeyboardEvent event) {
    if (_startEvent == null ||
        _startEvent.type != event.type ||
        _startEvent.keyCode != event.keyCode) {
      if (timer != null) {
        timer.cancel();
      }
      _startEvent = event;
      timer = new Timer(longpressDelay, () {
        longpress.add(_startEvent);
        timer = null;
      });
    }
  }
}

class LongPressTransformer
    implements StreamTransformer<KeyboardEvent, KeyboardEvent> {
  Stream<KeyboardEvent> bind(Stream<KeyboardEvent> stream) {
    KeyboardEvent startEvent;
    Duration delay = new Duration(seconds: 2);
    Timer timer;

    StreamSubscription streamSubscription;
    StreamController<KeyboardEvent> controller;

    void done() {
      streamSubscription.cancel();
      controller.close();
    }

    void onData(KeyboardEvent data) {
      if (startEvent == null || startEvent.keyCode != data.keyCode) {
        // changed
        if (timer != null) {
          timer.cancel();
        }
        startEvent = data;
        timer = new Timer(delay, () {
          controller.add(startEvent);
          timer = null;
        });
      }
    }

    void onListen() {
      streamSubscription =
          stream.listen(onData, onError: controller.addError, onDone: done);
    }

    controller = new StreamController<KeyboardEvent>.broadcast(
        onListen: onListen, onCancel: done);

    return controller.stream;
  }
}
