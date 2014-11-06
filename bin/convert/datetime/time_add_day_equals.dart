
void main() {

  var duration = new Duration(days : 1);
  print ("duration " + duration.toString());

  print('===');

//  var d1 = new DateTime(2014, 10, 26);
//  print ("d1 " + d1.toString());
//
//  d1 = d1.add(duration);
//  print ("d1 + duration " + d1.toString());
//
//  print('===');
//
//  var d2 = new DateTime(2014, 10, 20);
//  print ("d2 " + d2.toString());
//
//  d2 = d2.add(duration);
//  print ("d2 + duration " + d2.toString());
//
//  print('===');
//
//  var d3 = new DateTime(2014, 10, 21);
//  print ("d3 " + d3.toString());
//
//  d3 = d3.add(duration);
//  print ("d3 + duration " + d3.toString());
//
//  print('===');
//
//  var d4 = new DateTime(2014, 5, 22);
//  print ("d4 " + d4.toString());
//
//  d4 = d4.add(duration);
//  print ("d4 + duration " + d4.toString());

  DateTime januaryFirst = new DateTime(2014,1,2);

  for (int i = 0; i < 365; i++) {
    final date = januaryFirst.add(new Duration(days: i));
    //final date
  }

}
