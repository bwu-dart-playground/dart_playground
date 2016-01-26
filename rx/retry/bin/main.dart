import 'dart:io' show HttpClient, HttpClientRequest, HttpClientResponse;
import 'dart:async'
    show
        Future,
        Stream,
        StreamController,
        StreamSubscription,
        StreamTransformer,
        Timer;
import 'dart:convert' show UTF8;
import 'dart:math' show Random;

void main() {
  new RetryableStream(httpRequest)
      .transform(retry(3))
      .map(print)
      .listen((String e) => print('done'));

  new RetryableHttp()
      .transform(retry(3))
      .map(print)
      .listen((String e) => print('done'));
}

Future<String> httpRequest() async {
  final HttpClientRequest request =
      await new HttpClient().getUrl(Uri.parse('http://www.github.com'));
  final HttpClientResponse response = await request.close();

  return (await response
          .transform(UTF8.decoder as StreamTransformer<List<int>, dynamic>)
          .toList())
      .join();
}

class RetryableHttp extends RetryableStream {
  RetryableHttp({bool sync: false}) : super(httpRequest, sync: sync);

  static Future<String> httpRequest() async {
    final HttpClientRequest request =
        await new HttpClient().getUrl(Uri.parse('http://www.github.com'));
    final HttpClientResponse response = await request.close();

    return (await response
            .transform(UTF8.decoder as StreamTransformer<List<int>, dynamic>)
            .toList())
        .join();
  }
}

class RetryableStream<T> extends Stream<T> {
  final Function f;
  StreamController<T> _controller;

  RetryableStream(this.f, {bool sync: false}) {
    _controller = new StreamController<T>(
        onListen: _onListen,
        onPause: _onPause,
        onResume: _onResume,
        onCancel: _onCancel,
        sync: sync ?? false);
  }

  @override
  StreamSubscription<T> listen(void onData(T event),
      {Function onError, void onDone(), bool cancelOnError}) {
    return _controller.stream.listen(onData,
        onError: onError, onDone: onDone, cancelOnError: cancelOnError);
  }

  Timer _timer;

  Future _onListen() async {
    _timer = new Timer.periodic(const Duration(seconds: 1000), (_) {});
    _try();
  }

  Future _try() async {
    try {
      _controller.add(await f() as T);
    } catch (error) {
      _controller.addError(error);
    }
  }

  void _onCancel() {
    _timer.cancel();
  }

  void _onPause() {}

  void _onResume() {
    _try();
  }
}

RetryTransformer/*<S, T>*/ retry/*<S,T>*/([int numRetries = 3]) =>
    new RetryTransformer/*<S,T>*/(numRetries);

class RetryTransformer<S, T> implements StreamTransformer<S, T> {
  StreamController<T> _controller;
  StreamSubscription _subscription;
  Stream<S> _stream;
  int _numRetries;

  RetryTransformer(this._numRetries, {bool sync: false}) {
    _controller = new StreamController<T>(
        onListen: _onListen,
        onCancel: _onCancel,
        onPause: () {
          _subscription.pause();
        },
        onResume: () {
          _subscription.resume();
        },
        sync: sync ?? false);
  }

  void _onListen() {
    _subscription = _stream.listen(onData, onError: (dynamic error) {
      _subscription.pause();
      if (--_numRetries <= 0) {
        _onCancel();
        _controller.addError(error);
      } else {
        new Future(() => _subscription.resume());
      }
    }, onDone: () {
      _controller.close;
    });
  }

  void _onCancel() {
    _subscription?.cancel();
    _subscription = null;
  }

  void onData(S data) {
    _controller.add(data as T);
    _onCancel();
    _controller.close();
  }

  @override
  Stream<T> bind(Stream<S> stream) {
    this._stream = stream.asyncMap((S e) async => await e) as Stream<S>;
    return _controller.stream;
  }
}

///////////////////////////

//class Repeat {
//  bool isPaused = true;
//  bool isCancelled = false;
//  StreamController _controller;
//  final Function f;
//  final dynamic onError;
//  Repeat(this.f, {this.onError: null}) {
//    _controller = new StreamController(
//        onListen: _onListen,
//        onPause: _onPause,
//        onResume: _onResume,
//        onCancel: _onCancel);
//  }
//  Stream get stream => _controller.stream;
//
//  Future _onListen() async {
//    print('listen');
//    while (!isCancelled) {
//      while (!isPaused) {
//        _controller.add(await f());
//      }
//    }
//  }
//
//  void _onPause() {
//    print('pause');
//    isPaused = true;
//  }
//
//  void _onResume() {
//    print('resume');
//    isPaused = false;
//  }
//
//  void _onCancel() {
//    isCancelled = true;
//    _controller.close();
//  }
//
//  static Stream task2(Function f, {dynamic onError: null}) async* {
//    int i = 0;
//    while (true) {
//      try {
////         just to emulate failure
//        while (i++ < 2) {
//          print('throw');
//          throw '';
//        }
//        ////////////////////////
//        yield await f();
//      } catch (e) {
//        yield onError;
//      }
//    }
//  }
//}
