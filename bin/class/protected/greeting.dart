library greeting;

class GreetingEvent { /* ... */ }

abstract class Greeting { /* ... */ }

class GreetingImpl {
   void sendGreeting(GreetingEvent event) {
     print('Greeting');
   }
}
