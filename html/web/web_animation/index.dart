import 'dart:async';
import 'dart:html';

void main() {
  // Start an animation using Element.animate().
  // After 2 iterations, change its playback direction to 'reverse'.
  var target1 = document.getElementById('target1');
  var animation1 = target1.animate(
   [
       {'width': '200px', 'backgroundColor': 'green', 'offset': 0},
       {'width': '1000px', 'backgroundColor': 'cyan', 'offset': 1},
   ],
   {'duration': 2, 'iterations': 4, 'fill': 'both'});

  new Future.delayed(new Duration(seconds: 4), () { animation1.specified.direction = 'reverse'; });


  // Create an animation using new Animation() and play it using document.timeline.play().
  // After 2 iterations, change its timing function to steps(6, end).
  // After 3 iterations, pause it.
  var target2 = document.getElementById('target2');
  var animation2 = new Animation(
   target2,
   [
       {'backgroundColor': 'red', 'width': '200px', 'offset': 0},
       {'backgroundColor': 'purple', 'offset': 0.3},
       {'backgroundColor': 'yellow', 'width': '1000px', 'offset': 1}
   ],
   {'duration': 2, 'iterations': 4, 'fill': 'both'});
  var player2 = document.timeline.play(animation2);
  new Future.delayed(new Duration(seconds: 4), () { player2.source.specified.easing = 'steps(6, end)'; });
  new Future.delayed(new Duration(seconds: 6), () { player2.pause(); });
}