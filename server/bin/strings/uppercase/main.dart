main() {
  // var clef = '\u{1D11E}';
  //     clef.codeUnits;         // [0xD834, 0xDD1E]
  //     clef.runes.toList();    // [0x1D11E]
  String s = '\u{1D11E}this is a string';
  print(s);
  print('${s[0].toString()}${s.substring(1)}');
}
