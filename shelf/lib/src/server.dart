library shelf_playground.src.server;

import 'dart:async' show Future;
import 'dart:io' as io;
import 'dart:convert' show JSON;

import 'package:http_server/http_server.dart' as ht;

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as sIo;
import 'package:shelf_exception_response/exception_response.dart' as sEx;
import 'package:shelf_auth/shelf_auth.dart' as sAuth;
import 'package:shelf_route/shelf_route.dart' as sRoute;
import 'package:option/option.dart';

import 'package:logging/logging.dart' show Logger;

final _log = new Logger('bwu_server.server.server');
final _logShelf = new Logger('bwu_server.shelf');

class Server {
  final int servePort;
  io.HttpServer _httpServer;

  Server(this.servePort);

  Future<bool> init() {
    final userLookup = new TestUserLookup();

//    final sessionHandler = new sAuth.JwtSessionHandler(
//        'bwu_server.bwu-dart.com', '8zyaXDX1LfJD', userLookup);

//    final sessionMiddleware = sAuth.authenticate([],
//        // see http://openid.net/specs/draft-jones-json-web-token-07.html
//        //sessionHandler: sessionHandler,
//        allowHttp: true,
//        allowAnonymousAccess: false);

    final router = (sRoute.router()
      ..post('/anonymous', _handleAnonymousRequest)
//        ..post('/login', _handleLoginRequest,
//            middleware: _authMiddleware) // according to anders (SO) it should not be necessary to add _authMiddleware to each route
      ..post('/authenticated', _handleHttpRequest
              //, middleware: sessionMiddleware// TODO(zoechi) I guess all handlers requiring a session should be childs of a main route
    )
        //..get('/ws', sWs.webSocketHandler(_handleWebSocketConnect))
        );
    final handler =
        const shelf.Pipeline()
            .addMiddleware(shelf.logRequests(
                logger: (String msg, bool isError) =>
                    isError ? _logShelf.severe(msg) : _logShelf.info(msg)))
            //            .addMiddleware(_responseHeadersMiddleware)
//              .addMiddleware(_errorResponse)
        //.addMiddleware(sEx.exceptionResponse())
        .addHandler(router.handler);
        //.addHandler(_echoRequest);

//    final router = (sRoute.router()
//      ..post('/anonymous', _handleAnonymousRequest)
//      ..post('/login', _handleLoginRequest,
//          middleware: _authMiddleware) // according to anders (SO) it should not be necessary to add _authMiddleware to each route
//      ..post('/authenticated', _handleHttpRequest,
//          middleware: sessionMiddleware) // TODO(zoechi) I guess all handlers requiring a session should be childs of a main route
//      ..post('/service', _handleServiceHttpRequest,
//              middleware: sessionMiddleware)
//        //..get('/ws', sWs.webSocketHandler(_handleWebSocketConnect))
//        );
//
//    sRoute.printRoutes(router);
    return sIo
        .serve(handler, io.InternetAddress.ANY_IP_V6, servePort)
        .then((server) {
      _httpServer = server;
      //server.autoCompress = true;
      //server.defaultResponseHeaders.chunkedTransferEncoding = true;
      if (server.address == io.InternetAddress.ANY_IP_V6 ||
          server.address == io.InternetAddress.LOOPBACK_IP_V6) {
        _log.info('Serving at http://[${server.address.host}]:${server.port}');
      } else {
        _log.finest('Serving at http://${server.address.host}:${server.port}');
      }
      return true;
    });
  }

  shelf.Response _echoRequest(shelf.Request request) {
    return new shelf.Response.ok('Request for "${request.url}"');
  }

  Future<shelf.Response> _handleAnonymousRequest(shelf.Request request) {
    _log.finest('Request for "${request.url}"');
    return new Future.value(new shelf.Response.ok('AnonymousResponse'));
  }

  Future<shelf.Response> _handleLoginRequest(shelf.Request request) {
    _log.finest('Request for "${request.url}"');
    return new Future.value(new shelf.Response.ok('LoginResponse'));
  }

  Future<shelf.Response> _handleHttpRequest(shelf.Request request) {
    _log.finest('Request for "${request.url}"');
    return new Future.value(new shelf.Response.ok('AuthenticatedResponse'));
  }
}

class SysUser {
  final String name;
  SysUser(this.name);
}

class SysUserPrincipal {
  final String name;
  SysUserPrincipal(this.name);
}

class TestUserLookup<P extends sAuth.Principal> implements UserLookup {
  TestUserLookup();

  Future<Option<P>> call(String userId) {
    return new Future.value(
        new Option<SysUserPrincipal>(new SysUserPrincipal('someUserName')));
  }

  Future<SysUser> checkUser(String userId, String email, bool emailVerified,
      List<String> scopes, String accessToken, String refreshToken) {
    return new Future.value(new SysUser('someUse'));
  }
}

abstract class UserLookup<P extends sAuth.Principal> implements Function {
  Future<Option<P>> call(String userId);
  Future<SysUser> checkUser(String userId, String email, bool emailVerified,
      List<String> scopes, String accessToken, String refreshToken);
}
