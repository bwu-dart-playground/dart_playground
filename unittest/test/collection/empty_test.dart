import 'package:test/test.dart';

main() {
  test('xx', () {
    var x;
    expect(x, isNotNull);
  });

  test('yy', () {
    Map x = {};
    expect(x, isNotEmpty);
  });
}
