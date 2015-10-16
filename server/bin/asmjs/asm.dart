import 'dart:io' as io;
import 'dart:convert' show UTF8;

main() async {
  io.Socket socket = await io.Socket.connect('54.166.103.235', 8090);
//  socket.
  io.HttpClientRequest req = await new io.HttpClient().getUrl(Uri.parse('http://54.166.103.235:8090/?NOCRYPTO=1;STATUS=1;AUTOLOCK=0;WAN=20;GUID=73e03072-c81c-f410-849e-2748026f2f9f'));
  io.HttpClientResponse resp = await req.close();
  await for (var data in resp) {
    print(UTF8.decode(data));
  }

}
