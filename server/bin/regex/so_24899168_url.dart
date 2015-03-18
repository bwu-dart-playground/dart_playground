import 'dart:io' as io;

void main(args) {
  print('hello');
  //var urlPattern = r"^\s*$|\b[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|asia|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel)\b";
  //var urlPattern = r"^\s*$"; // finds spaces
  //var urlPattern = r"\b[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+(?:[A-Z]{2}|asia|com|org|net|gov|mil|biz|info|mobi|name|aero|jobs|museum|travel)\b";
  // \b word boundaries
  //var urlPattern = r"(https?|ftp)://([-a-zA-Z0-9.]+)(/[-a-zA-Z0-9+&@#/%=~_|!:,.;]*)?(\?[a-zA-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  var urlPattern = r"(https?|ftp)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  var result = new RegExp(urlPattern, caseSensitive: false).firstMatch('https://www.google.com');
  printResult(result);

}

void printResult(Match m) {
  for(int i = 0; i <= m.groupCount; i++) {
    print("Group $i: ${m.group(i)}");
  }
}