import 'dart:async' as async;

void main() {
  new async.Future.delayed(
      new Duration(milliseconds: 10),
      () => doSomething().then((_) {})
      .catchError((e) => print('Error1: $e')));
}

async.Future doSomething() {
  async.Completer c = new async.Completer();
  async.Future f = c.future.timeout(new Duration(milliseconds: 25), onTimeout: () {
    if (!c.isCompleted) {
      c.completeError('timed out');
    }
  });
  f.catchError((e) => print('timeoutError'));

  print('doSomething');

  async.Completer c2 = new async.Completer();
  c2.future.catchError((e) {
    if (!c.isCompleted) {
      c.completeError(e);
    }
  }).then((_) {
    if (!c.isCompleted) {
      c.complete();
    }
  });

  var x = doSomethingElse;
  x(c2);

  return c.future;
}

async.Future doSomethingElse(async.Completer c2) {
  return new async.Future.delayed(new Duration(milliseconds: 10), () {

    print('inisde delayed');
    new async.Future.delayed(new Duration(milliseconds: 10), () {
      c2.completeError('some error');
    });
  });

}
