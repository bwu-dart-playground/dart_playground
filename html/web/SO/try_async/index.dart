import 'dart:html' as dom;

main() async {
  try {
    final response = await dom.HttpRequest.getString(
        'https://gist.githubusercontent.com/zoechi/3d6cb61b9383e006f73f/raw/9100c1b19007bacb67c6ff4d292d6fcfd17f8742/main.dart');
    print(response);
  } catch (e) {
    print(e.runtimeType);
    print(e.message);
  }
}
