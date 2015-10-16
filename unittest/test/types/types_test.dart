library test_playground.test.types;

import 'package:unittest/unittest.dart';
import 'package:stack_trace/stack_trace.dart' show Chain;

void main() {
  Chain.capture(() => _main(), onError: (error, stack) {
    print(error);
    print(stack.terse);
  });
}

class X<T> {

}

void _main() {
  group('X', () {
    test('isInstanceOf generic', () {
      expect(new X(), new isInstanceOf<X>());
      expect(new X<int>(), new isInstanceOf<X>());

      switch (new X<int>().runtimeType) {
        case X:
          break;
        default:
          fail('[] should be recognized as list');
      }
    });

    test('isInstanceOf plain', () {
      expect(new X(), new isInstanceOf<X>());
      expect(new X<int>(), new isInstanceOf<X>());

      switch (new X().runtimeType) {
        case X:
          break;
        default:
          fail('[] should be recognized as list');
      }
    });

  });

  group('List', () {
    test('isInstanceOf', () {
      expect([], new isInstanceOf<List>());
      expect(new List(5), new isInstanceOf<List>());
      expect([].runtimeType, equals(new List().runtimeType));

      switch (new isInstanceOf<int>().runtimeType) {
        case isInstanceOf:
          break;
        default:
          fail('[] should be recognized as list');
      }
    });
  });

  group('Map', () {
    test('isInstanceOf', () {
      expect({}, new isInstanceOf<Map>());
      expect(new Map(), new isInstanceOf<Map>());
      expect({}.runtimeType, equals(new Map().runtimeType));

      switch (new Map().runtimeType) {
        case Map:
          break;
        default:
          fail('[] should be recognized as list');
      }
    });
  });

  group('Set', () {
    test('isInstanceOf', () {
      expect(new Set(), new isInstanceOf<Set>());

      switch (new Set().runtimeType) {
        case Set:
          break;
        default:
          fail('[] should be recognized as list');
      }
    });
  });
}
