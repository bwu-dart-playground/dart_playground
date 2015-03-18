import 'package:unittest/unittest.dart';
import 'package:matcher/matcher.dart';

void main(args) {
  List<List<int>> board = [[],[],[],[],[],[],[],[],[],[]];

  test('', () {
    expect(board, everyElement((List e) => e is List && e.length == 0));
  });
}