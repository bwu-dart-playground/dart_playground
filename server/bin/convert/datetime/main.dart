import 'package:intl/intl.dart';

void main() {
  var date = 'Mon, 11 Aug 2014 12:53 pm PDT';
  DateFormat format = new DateFormat("EEE, dd MMM yyyy hh:mm a zzz");
  date = date.replaceFirst(' pm', ' PM').replaceFirst(' am', ' AM');
  print(date);
  print(format.parse(date));
}
