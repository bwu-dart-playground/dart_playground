import 'dart:async' show Future, Stream;

main() async {
  int total = 0;
  print("Please input an URL");
  //var url = stdin.readLineSync();

  var list = await getImageUrls('url');
  for(int i = 0; i < list.length; i++) {
    var imageUrl = list[i];
    var r = await getImageSize(imageUrl);
    print("$imageUrl, Size: $r bytes");
    total += r;
  }
  print(total);
}

Future<List<int>> getImageUrls(String url) => new Future.delayed(
    const Duration(milliseconds: 200), () => [10, 20, 30, 40, 50, 60, 70]);

Future<int> getImageSize(int size) =>
    new Future.delayed(const Duration(milliseconds: 200), () => size);
