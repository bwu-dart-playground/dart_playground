import 'dart:html';

void main() {
  int snowLeft = 500;
  querySelector("#sample_text_id")
  .animate([{'transform': 'translate(${snowLeft}px, -100%)'},
    {'transform': 'translate(${snowLeft}px, ${window.innerHeight}px)'}
  ], 1500);
}

