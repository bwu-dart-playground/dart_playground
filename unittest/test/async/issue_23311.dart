import 'package:test/test.dart';

void main() {
  group('package_test', () {
    test('package', () async {
      expect('x', 'x'); // << try to set and hit breakpoint here
    });
  });
}
