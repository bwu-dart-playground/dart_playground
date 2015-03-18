library custom_greeting;

import 'greeting.dart';

class HugGreeting extends Greeting {
  GreetingProtected _protected;
  HugGreeting() : super(_setProtected);

  static _setProtected(HugGreeting greeting, GreetingProtected protected) =>
      greeting._protected = protected;

  void someMethod() {
    // code here uses sendGreeting()
    _protected.sendGreeting(new GreetingEvent('someMethod'));
  }
}
