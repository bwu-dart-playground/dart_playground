const sampleText = "Sample const text";

main() async {
  var resource = const Resource('package:resource_example/resource/sample.txt');

//  var uriEncoded = sampleText.replaceAll(' ', '%20');
//  var resource = new Resource('data:application/dart;charset=utf-8,$uriEncoded');

//  var base64Encoded = 'U2FtcGxlIHRleHQgZmlsZQ==';
//  var resource = new Resource('data:application/dart;charset=utf-8,$base64Encoded');

//var uri = new Uri.file('lib/resource/sample.txt');
//var resource = new Resource(uri.toString());

//  var resource = new Resource('data:application/dart;charset=utf-8;base64,$base64Encoded');
  print(await resource.readAsString());
  print(await resource.readAsBytes());

}
