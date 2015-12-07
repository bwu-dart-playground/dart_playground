@TestOn('vm')
library bwu_datagrid_examples.test.e03_editing_test;

import 'dart:async' show Future, Stream;

import 'package:test/test.dart';
import 'package:webdriver/io.dart' as wd;

class WebElement implements wd.WebElement {
  Future<String> text;

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

dynamic main() async {
}

class By implements wd.By {
  @override
  Map<String, String> toJson() {
    return {};
  }

  const By.cssSelector(String x);
  const By.shadow(String x);
}
const By buttonsSelector = const By.cssSelector('body > div > div > button');

/// Find the buttons in the multiline text editor.
Future<WebElement> findButton(wd.WebDriver driver, String text) async {
  return driver
      .findElements(buttonsSelector)
      .asyncMap((WebElement e) async => {'button': e, 'text': await e.text})
      .where((Map m) => m['text'] == text)
      .map((Map m) => m['button'])
      .first as WebElement;
}
