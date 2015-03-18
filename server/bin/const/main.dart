class SomeEnum {
  static const SomeEnum FIRST = const SomeEnum._(1, 'FIRST');

  static const List<SomeEnum> values = const <SomeEnum> [FIRST,];

  final value;
  final name;
  const SomeEnum._(this.value, this.name);
}

enum SomeOtherEnum {
  a, b, c,
}

const String IP_ADDRESS = "http://192.168.1.103:8088/";
const String HOME_EXPECTED = IP_ADDRESS + "index.html";

void main() {
  const x = SomeEnum.FIRST.name;
  const y = SomeOtherEnum.a;
}
