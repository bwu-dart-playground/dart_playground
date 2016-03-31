import 'package:intl/intl.dart';

void main() {
  DateTime now = new DateTime.now();
   var formatter = new DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
   String nowFormatted = formatter.format(now);
  print(nowFormatted);
}
