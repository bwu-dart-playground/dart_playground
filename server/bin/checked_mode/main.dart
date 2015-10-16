import 'dart:convert' show JSON;

main() {
  print(JSON.encode({'tick': 829, 'start': {87: 0, 88: 1}}));
  //var r = get(false);
  var r = get(false);
  fn(r);
  print('Done');

}

fn(String x) {}

DateTime get(bool returnDate) {
  if (returnDate) {
    return new DateTime(2015, -5);
  } else {
    return 'string';
  }
}
