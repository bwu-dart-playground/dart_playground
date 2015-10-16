import 'dart:async';

class SqlResultSet {
  List rows;
  SqlResultSet(this.rows);
}

Future _runInTxn(txn(Transaction x)) {
  print('_runInTxn');
  return new Future.value(txn(new Transaction()));
}

class Transaction {
  Future executeSql(
      String sql, List args, callBack(Transaction txn, SqlResultSet rs)) {
    return Future.wait([
      new Future.value(callBack(this, new SqlResultSet(
          [{'value': 'a'}, {'value': 'b'}, {'value': 'c'}, {'value': 'd'}]))),
      new Future.value(callBack(this, new SqlResultSet(
          [{'value': 'e'}, {'value': 'f'}, {'value': 'g'}, {'value': 'h'}]))),
      new Future.value(callBack(this, new SqlResultSet(
          [{'value': 'i'}, {'value': 'i'}, {'value': 'j'}, {'value': 'k'}]))),
    ]);
  }
}

main() async {
//  new SqlResultSet(
//            [{'value': 'a'}, {'value': 'b'}, {'value': 'c'}, {'value': 'd'}]).rows.map((row) => print('row: ${row['value']}'));
  await for (var value in _all()) {
    print(value);
  }
}

Stream<String> _all() {
  var sql = 'SELECT id,value FROM storeName';
  var sc = new StreamController();

  _runInTxn((txn) {
    print('in Txn');
    return txn.executeSql(sql, [], (txn, rs) {
      rs.rows.map((row) => print('row: ${row['value']}'));
      rs.rows.map((row) => sc.add(row['value']));
      return new Future.delayed(Duration.ZERO, () => print('rows ${rs.rows}'));
    });
  }).then((_) { print('close');  sc.close();});

  return sc.stream;
}


//
//Stream<String> _all() async* {
//  var sql = 'SELECT id,value FROM $toreName';
//  SqlResultSet resultSet;
//
//  await _runInTxn((txn) {
//    txn.executeSql(sql, [], (txn, rs) {
//      resultSet = rs;
//    });
//  });
//
//  for (var i = 0; i < resultSet.rows.length; ++i) {
//    var row = resultSet.rows.item(i);
//    yield row['value'];
//  }
//}
