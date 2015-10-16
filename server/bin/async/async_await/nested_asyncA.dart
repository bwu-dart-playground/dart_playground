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
    // generate async result sets and complete the Future when done
    return Future.wait([
      new Future.delayed(Duration.ZERO, () => callBack(this, new SqlResultSet(
          [{'value': 'a'}, {'value': 'b'}, {'value': 'c'}, {'value': 'd'}]))),
      new Future.delayed(Duration.ZERO, () => callBack(this, new SqlResultSet(
          [{'value': 'e'}, {'value': 'f'}, {'value': 'g'}, {'value': 'h'}]))),
      new Future.delayed(Duration.ZERO, () => callBack(this, new SqlResultSet(
          [{'value': 'i'}, {'value': 'i'}, {'value': 'j'}, {'value': 'k'}]))),
    ]);
  }
}

main() async {
  await for (var value in _all()) {
    print('value: $value');
  }
}

Stream<String> _all() {
  var sql = 'SELECT id,value FROM storeName';
  var sc = new StreamController();

  _runInTxn((txn) {
    print('in Txn');
    return txn.executeSql(sql, [], (txn, rs) {
      rs.rows.forEach((row) => sc.add(row['value']));
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
