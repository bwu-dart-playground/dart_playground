enum Status {
  none,
  running,
  stopped,
  paused
}

void main() {
  print(Status.values);

  Status.values.forEach((v) => print('value: $v, index: ${v.index}'));

  print('running: ${Status.running}, ${Status.running.index}');

  print('running index: ${Status.values[1]}');

  Status x = Status.paused;
  switch(x) {
    case Status.none:
      print('${x.index}, ${x}');
      break;
    case Status.running:
      print('${x.index}, ${x}');
      break;
    case Status.stopped:
      print('${x.index}, ${x}');
      break;
    case Status.paused:
      print('${x.index}, ${x}');
      break;
  }
}
