import 'package:smoke/smoke.dart' as sk;

void main() {
  var p = sk.query(DateTime, new sk.QueryOptions())[0];

  print(p);
}