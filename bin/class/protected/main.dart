library main;
import 'custom_greeting.dart';
import 'greeting.dart';

void main() {
  var hug = new HugGreeting();
  hug._sendGreeting(new GreetingEvent());
  // should not compile
}

// See http://stackoverflow.com/questions/28350655
