library custom_greeting;
import 'greeting.dart';

class HugGreeting implements Greeting {
  GreetingImpl _greeting = new GreetingImpl();

  void someMethod() {
    // code here uses sendGreeting()
    sendGreeting('bla');
  }
}
