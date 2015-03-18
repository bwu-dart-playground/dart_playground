library greeting;

class GreetingEvent {
  final message;
  GreetingEvent(this.message);
  toString() => message;
}

abstract class Greeting {
  Greeting(Function setProtected) {
    setProtected(this, new GreetingProtected(this));
  }
  // protected
  void _sendGreeting(GreetingEvent event) {
    print(event);
  }
}

class GreetingProtected {
  // protected
  final _greeting;
  GreetingProtected(this._greeting);

  void sendGreeting(GreetingEvent event) => _greeting._sendGreeting(event);
}
