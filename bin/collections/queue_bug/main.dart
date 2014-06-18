import 'dart:collection';

Queue q = new Queue();

void main(args) {
  for(int i = 0; i < 10; i++) {
    q.add(i);
  }

  while(q.length > 0) {
    print(q.removeFirst());
  }

  for(int i = 0; i < 10; i++) {
    q.add(i);
  }

  while(q.length > 0) {
    print(q.removeLast());
  }

}