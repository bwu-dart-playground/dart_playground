// 29567236
class Status {
  static const off = const Status._(0);
  static const on = const Status._(1);

  final int value;
  const Status._(this.value);
}

doSomething1([Status status = Status.off]) {
  if(status != null && status == Status.on) {
    print(status.value);
  }
}

enum Status2 {
  off,
  on
}

doSomething2([Status2 status = Status2.off]) {
  if(status != null && status == Status2.on) {
    print(status.index);
  }
}

void main() {
  doSomething1(Status.on);
  doSomething2(Status2.on);
}
