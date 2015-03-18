import 'dart:io';
import 'dart:convert' show UTF8;

void main(args) {
String JsonContent="";

new HttpClient().getUrl(Uri.parse('http://www.google.com'))
  .then((HttpClientRequest request)
   {
      request.headers.removeAll(HttpHeaders.ACCEPT_ENCODING);
      return request.close();
   })
  .then((HttpClientResponse response)
   {
      response.transform(UTF8.decoder).listen((contents) {
        JsonContent = contents.toString();
        print(JsonContent);
        //onDataLoaded(JsonContent);
      }, onDone: () => onDataLoaded(JsonContent));
   });

}

void onDataLoaded(String jsonContent) {
  print(jsonContent);
}