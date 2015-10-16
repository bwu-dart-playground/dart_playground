// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'package:args/args.dart';
//import 'package:shelf/shelf.dart' as shelf;
//import 'package:shelf/shelf_io.dart' as io;
import 'package:stack_trace/stack_trace.dart' show Chain;
import 'package:logging/logging.dart' show Logger, Level;
import 'package:quiver_log/log.dart' show BASIC_LOG_FORMATTER, PrintAppender;

import 'package:shelf_playground/src/server.dart';
import 'package:shelf_playground/src/client.dart';
import 'package:bwu_utils_server/bwu_utils_server.dart';

void main() {
  Chain.capture(() => _main(), onError: (error, stack) {
    print(error);
    print(stack.terse);
  });
}

_main() async {
  Logger.root.level = Level.FINEST;
  var appender = new PrintAppender(BASIC_LOG_FORMATTER);
  appender.attachLogger(Logger.root);


  final ipPort = await getNextFreeIpPort();
  await new Server(ipPort)..init();
  final response = await new Client('http://[::]:${ipPort}/anonymous').simpleRequest('Something');
  print(response);



//
//
//  var handler = const shelf.Pipeline()
//      .addMiddleware(shelf.logRequests())
//      .addHandler(_echoRequest);
//
//  io.serve(handler, 'localhost', port).then((server) {
//    print('Serving at http://${server.address.host}:${server.port}');
//  });
}

//shelf.Response _echoRequest(shelf.Request request) {
//  return new shelf.Response.ok('Request for "${request.url}"');
//}
