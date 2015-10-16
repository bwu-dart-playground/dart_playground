import 'package:http/http.dart' as http;
import 'dart:async' show Future, Stream;
import 'dart:io';

Future<Null> handleUploadRequest(final HttpRequest httpRequest) async {
  print('handle upload -------------------------');
  print('httpRequest: ${httpRequest.headers}');

  var data;

  var builder = await httpRequest.fold(new BytesBuilder(), (b, d) => b..add(d));
  data = builder.takeBytes();
  print('bytes builder: ${data}');

  // Uploading image to rackspace cloud files
  var url =
      'https://storage101.dfw1.clouddrive.com/v1/{accountnumber}/{container}/';
  var response = await http.put(url,
      headers: {
        'X-Auth-Token': '{XXXXXXXXXAPI_KEYXXXXXXXXXX}',
        'Content-Type': 'image/jpeg',
        'Content-Length': '${httpRequest.headers.contentLength}',
      },
      body: data);

  print("Response status: ${response.statusCode}");
  print("Response body: ${response.body}");

  print('closing connection with data complete');
  httpRequest.response.write(data);
  await httpRequest.response.close();
}
