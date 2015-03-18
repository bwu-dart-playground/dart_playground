library main;
import 'custom_greeting.dart';
import 'greeting.dart';

void main() {
  var hug = new HugGreeting();
  //hug.sendGreeting(new GreetingEvent('someMessage'));
  // should not compile
  hug.someMethod();
}

// See http://stackoverflow.com/questions/28350655
