
void main(args) {
  String s = 'move s:text/bwu-datagrid-recycle file:text/blajflaskjfd';
  var match = new RegExp(r'^(?:copy|link|move)(.*)').firstMatch(s);
  var matches = new RegExp(r'(?: +[a-z]*:)([^ ]*)').allMatches(match.group(1));

  List<String> results = [];
  matches.forEach((e) {
    results.add(e.group(1));
  });

}