import 'package:di/di.dart';
import 'package:di/dynamic_injector.dart';

/**
 * Annotation used to mark classes for which static type factory must be
 * generated. For testing purposes not all classes are marked with this
 * annotation, some classes are included in @Injectables at the top.
 */
class Injectable {
  const Injectable();
}

/**
 * Some dummy WebSocket class (just for demonstration)
 */
@Injectable()
class WebSocket {
  String url;
  WebSocket(this.url);
}

/**
 * Allows to mark an injectable as 'one'
 */
class One {
  const One();
}

/**
 * Allows to mark an injectable as 'two'
 */
class Two {
  const Two();
}

/**
 * A class that implements updates.
 * It needs a websocket marked as 'one'
 */
class Updates {
  WebSocket ws;
  Updates(@One() this.ws);
}


/**
 * A class that implements chats.
 * It needs a websocket marked as 'two'
 */
class Chat {
  WebSocket ws;
  Chat(@Two() this.ws);
}

/**
 * The application module
 */
class AppModule extends Module {
  AppModule() {
    value(String, 'http://www.google.com', withAnnotation: AjaxUrl);
    value(int, 8080, withAnnotation: ServerPort);
    value(int, 1000);
    factory(WebSocket, (Injector i) => new WebSocket('ws://game.example.com:12010/updates'), withAnnotation: One);
    factory(WebSocket, (Injector i) => new WebSocket('ws://chat.example.com/games'), withAnnotation: Two);
    type(Chat);
    type(Updates);
  }

  Injector _injector;
  Injector get injector {
    if (_injector == null) {
      _injector = new DynamicInjector(modules: [this]);

      // Static injector => comment in and comment out above
      //      _injector = new StaticInjector(modules: [this],
      // typeFactories: type_factories_gen.typeFactories);
    }
    return _injector;
  }
}

/**
 * Allows to mark a String as ajax url
 * Just to demonstrate how to use primitive types with DI
 */
class AjaxUrl {
  const AjaxUrl();
}

/**
 * Allows to mark an int as server port
 * Just to demonstrate how to use primitive types with DI
 */
class ServerPort {
  const ServerPort();
}


void main(List<String> args) {
  var module = new AppModule();

  print('AjaxUrl: ${module.injector.get(String, AjaxUrl)}');
  print('ServerPort: ${module.injector.get(int, ServerPort)}');
  // primitives without annotation are not supported and throw an exception
  // print('int: ${module.injector.get(int)}');
  print('Chat: ${module.injector.get(Chat).ws.url}');
  print('Updates: ${module.injector.get(Updates).ws.url}');
}

