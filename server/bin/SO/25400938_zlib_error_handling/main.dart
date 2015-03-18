import 'dart:io';
main() {
  try {
    ZLIB.decode([1,2,3,4,5]);
  } catch(e, s) {
    print('$e, $s');
    // InternalError: 'Filter error, bad data'
  }
}