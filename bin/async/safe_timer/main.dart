import 'dart:async';
import 'dart:math';
void main() {
  Timer timer;
  Future safeTimer(Duration duration, [computation()]) {
    Completer completer = new Completer();
    Future result = completer.future;
    if (computation != null) {
      result = result.then((ignored) => computation());
    }
    timer = new Timer(duration, completer.complete);
    return result;
  }
  var rng = new Random();
  foo(m){
    if (rng.nextInt(2) != 1) throw(new StateError('!= 1'));
    return "$m $m";
        }
  safeTimer(new Duration(seconds: 1), ()=>foo("hello!"))
  .then(print, onError: (e){
    print("error $e");
  });
}